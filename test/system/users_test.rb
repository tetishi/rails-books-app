require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
    include Warden::Test::Helpers
  
    setup do
      Warden.test_mode!
      @user = users(:user1)
      login_as(@user)
    end

    test "visiting the index" do
      visit users_url
      assert_selector "h1", text: "ユーザー一覧"
    end

    test "creating a User" do
      logout
      visit new_user_registration_path
    
      fill_in "Eメール", with: "example@gmail.com"
      fill_in "パスワード", with: "examplepassword"
      fill_in "パスワード（確認用）", with: "examplepassword"
      click_on "アカウント登録"
    
      assert_text "アカウント登録が完了しました。"
    end

    test "updating a User" do
        visit root_path
        click_on "ユーザ編集"
    
        fill_in "Eメール", with: "example@gmail.com"
        fill_in "郵便番号", with: "8329932"
        fill_in "住所", with: "Japan"
        fill_in "自己紹介", with: "こんにちは"
        fill_in "パスワード", with: "password1"
        fill_in "パスワード（確認用）", with: "password1"
        fill_in "現在のパスワード", with: "examplepassword"
        click_on "更新"
    
        assert_text "アカウント情報を変更しました。"
        click_on "戻る"
    end

    test "destroying a User" do
        visit root_path
        click_on "ユーザ編集"
        page.accept_confirm do
          click_on "アカウント削除"
        end
        assert_text "アカウントを削除しました。"
    end
end

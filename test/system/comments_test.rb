# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!
    @comment = comments(:one)
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the book comment index" do
    visit books_url
    click_on "表示", match: :first
    assert_selector "h3", text: "コメント"
  end

  test "visiting the report comment index" do
    visit reports_url
    click_on "表示", match: :first
    assert_selector "h3", text: "コメント"
  end

  test "creating a Comment" do
    visit books_url
    click_on "表示", match: :first

    fill_in "コメント記入", with: "コメントした"
    click_on "登録する"

    assert_text "コメントが追加されました"
    click_on "戻る"
  end

  test "destroying a Comment" do
    visit books_url
    click_on "表示", match: :first

    fill_in "コメント記入", with: "コメントした"
    click_on "登録する"

    assert_text "コメントが追加されました"

    page.accept_confirm do
      click_on "削除", match: :first
    end

    click_on "戻る"
  end

  test "visiting the user who wrote a Comment" do
    visit books_url
    click_on "表示", match: :first

    fill_in "コメント記入", with: "コメントした"
    click_on "登録する"

    assert_text "コメントが追加されました"

    click_on "ユーザー詳細", exact: :first
    assert_selector "h1", text: "プロフィール"
  end
end

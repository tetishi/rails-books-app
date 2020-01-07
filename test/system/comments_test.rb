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
    assert_selector "h3", text: "Comments"
  end

  test "visiting the report comment index" do
    visit reports_url
    click_on "Show", match: :first
    assert_selector "h3", text: "Comments"
  end

  test "creating a Comment" do
    visit books_url
    click_on "表示", match: :first

    fill_in "Add a comment", with: "コメントした"
    click_on "登録する"

    assert_text "Your comment was successfully posted."
    click_on "戻る"
  end

  test "destroying a Comment" do
    visit books_url
    click_on "表示", match: :first

    fill_in "Add a comment", with: "コメントした"
    click_on "登録する"

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "translation missing: ja.books.comments.destroy.notice"
  end


#   test "updating a Report" do
#     visit reports_url
#     click_on "Edit", match: :first

#     fill_in "タイトル", with: @report.title
#     fill_in "内容", with: @report.body
#     click_on "更新する"

#     assert_text "Report was successfully updated"
#     click_on "Back"
#   end
end

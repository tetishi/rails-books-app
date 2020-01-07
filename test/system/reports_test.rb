require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    @report = reports(:one)
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "creating a Report" do
    visit reports_url
    click_on "New Report"

    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.body
    click_on "登録する"

    assert_text "Report was successfully created"
    click_on "Back"
  end

  test "updating a Report" do
    visit reports_url
    click_on "Edit", match: :first

    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.body
    click_on "更新する"

    assert_text "Report was successfully updated"
    click_on "Back"
  end

  test "destroying a Report" do
    visit reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report was successfully destroyed"
  end
end

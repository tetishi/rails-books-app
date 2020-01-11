# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!
    @report = reports(:report1)
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "日報"
  end

  test "creating a Report" do
    visit reports_url
    click_on "新規作成"

    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.body
    click_on "登録する"

    assert_text "日報が登録されました"
    click_on "戻る"
  end

  test "updating a Report" do
    visit reports_url
    click_on "編集", exact: :first
    assert_selector "h1", text: "日報の編集"

    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.body
    click_on "更新する"

    assert_text "日報が更新されました"
    click_on "戻る"
  end

  test "destroying a Report" do
    visit reports_url

    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "日報が削除されました"
  end
end

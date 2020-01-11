# frozen_string_literal: true

require "application_system_test_case"

class FriendshipsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the index" do
    visit timeline_user_path(@user.id)
    assert_selector "h2", text: "投稿一覧"
  end

  test "following a User" do
    visit users_url
    click_on "jiro@gmail.com"
    click_button "Follow"
  end

  test "unfollowing a User" do
    visit users_url
    click_on "jiro@gmail.com"
    click_button "Follow"
    click_button "Unfollow"
  end
end

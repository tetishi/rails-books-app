# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
    @user3 = users(:user3)
  end

  test "user1 は user2 をフォローする" do
    @user1.follow(users(:user2))
    assert @user1.following.include?(users(:user2))
  end

  test "user1 は user2 をアンフォローする" do
    @user1.follow(users(:user2))
    @user1.unfollow(users(:user2))
    assert_not @user1.following.include?(users(:user2))
  end

  test "ユーザーのフォロー状態をみる" do
    @user1.follow(users(:user2))
    assert @user1.following?(users(:user2))
    assert_not @user1.following?(users(:user3))
  end
end

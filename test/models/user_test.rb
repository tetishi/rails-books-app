require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test 'user1 は user2 をフォローする' do
    @user1.follow(users(:user2))
    assert @user1.following.include?(users(:user2))
  end

  # test 'create course' do
  #   login_user 'ishida', 'testtest'
  #   visit '/courses/new'
  #   assert true
  # end
end

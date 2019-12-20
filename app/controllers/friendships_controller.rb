class FriendshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:followed_id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
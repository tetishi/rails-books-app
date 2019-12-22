class FriendshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def create
    # @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
    # render template: '/friendships/:id'
  end

  private

  def find_user
    # @user = User.find(params[:user_id])
    # @usr = User.find(params[:id])
    @user = User.find(params[:user_id])
  end
end

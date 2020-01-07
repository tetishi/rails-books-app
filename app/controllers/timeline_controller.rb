class TimelineController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @users = current_user.following

    @books = Book.where(user_id: @users.ids)
    @my_books = Book.where(user_id: current_user.id)
    @posts = (@books + @my_books).sort_by { |t|
      t[:updated_at]
    }.reverse!

    render 'show_timeline'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

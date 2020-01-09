# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: t("activerecord.attributes.comment.posted")
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end

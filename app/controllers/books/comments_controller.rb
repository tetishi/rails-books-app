# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: @commentable
  end

  private
    def set_commentable
      @commentable = Book.find(params[:book_id])
    end
end

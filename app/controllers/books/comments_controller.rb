class Books::CommentsController < CommentsController
  before_action :set_commentable

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: @commentable, notice: t(".notice")
  end

  private

    def set_commentable
      @commentable = Book.find(params[:book_id])
    end
end

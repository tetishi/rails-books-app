# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: @commentable, notice: t("activerecord.attributes.comment.destroyed")
  end

  private
    def set_commentable
      @commentable = Report.find(params[:report_id])
    end
end

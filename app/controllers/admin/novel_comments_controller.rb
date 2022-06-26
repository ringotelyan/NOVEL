class Admin::NovelCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @novel = Novel.find(params[:novel_id])
    @comment = NovelComment.find(params[:id])
    @comment.destroy
  end
end

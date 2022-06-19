class Admin::NovelCommentsController < ApplicationController

  def destroy
    @novel = Novel.find(params[:novel_id])
    @comment = NovelComment.find(params[:id])
    @comment.destroy
  end

end

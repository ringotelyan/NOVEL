class Public::NovelCommentsController < ApplicationController

  def create
    novel = Novel.find(params[:novel_id])
    comment = current_user.novel_comments.new(novel_comment_params)
    comment.novel_id = novel.id
    comment.save
    redirect_to public_novel_path(novel)
  end

  private

  def novel_comment_params
    params.require(:novel_comment).permit(:comment)
  end

end

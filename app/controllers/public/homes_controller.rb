class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    novels = Novel.all.order(created_at: :desc)
    @novels = novels.where(user_id: [current_user.following_ids])
  end
end

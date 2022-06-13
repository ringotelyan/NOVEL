class Public::FavoritesController < ApplicationController

  def create
    novel = Novel.find(params[:novel_id])
    favorite = current_user.favorites.new(novel_id: novel.id)
    favorite.save
    # 画面遷移が行われ非同期処理が行われなくなるため、「redirect_to」の記述を削除
  end

  def destroy
    novel = Novel.find(params[:novel_id])
    favorite = current_user.favorites.find_by(novel_id: novel.id)
    favorite.destroy
    # 画面遷移が行われ非同期処理が行われなくなるため、「redirect_to」の記述を削除
  end

end

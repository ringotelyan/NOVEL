class Public::NovelsController < ApplicationController
  before_action :correct_user, only: [:update, :edit]
  before_action :ensure_guest_user, only: [:new]

  def new
    @novel = Novel.new
    @genres = Genre.all
  end

  # 投稿データの保存
  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id # 投稿データにログイン中のユーザーのIDを持たせる
    if @novel.save
      flash[:notice] = '小説の投稿に成功しました'
      redirect_to public_novel_path(@novel.id)
    else
      @genres = Genre.all
      flash.now[:alert] = '小説の投稿に失敗しました'
      render :new
    end
  end

  def index
    # @novels = Novel.includes(:favorited_users)
    #novels = Novel.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    #@novels = Kaminari.paginate_array(novels).page(params[:page]).per(10)
    #@novels = Novel.left_joins(:active_favorites).group(:id).order('count(favorites.novel_id) desc').page(params[:page]).per(10)
    novels = Novel.left_joins(:active_favorites).group(:id).order('count(favorites.novel_id) desc')
    @novels = novels.includes(:user).where(users: {is_deleted: false}).page(params[:page]).per(10)

      #sort {|a,b|
        #b.favorited_users.size <=>
        #a.favorited_users.size}
    @user = current_user
  end

  def show
    @novel = Novel.find(params[:id])
    @novel_comment = NovelComment.new
    @genre = @novel.genre_id
    unless ViewCount.find_by(user_id: current_user.id, novel_id: @novel.id)
      current_user.view_counts.create(novel_id: @novel.id)
    end
  end

  def edit
    @novel = Novel.find(params[:id])
    @genres = Genre.all
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      flash[:notice] = '小説の編集に成功しました'
      redirect_to public_novel_path(@novel.id)
    else
      @genres = Genre.all
      flash.now[:alert] = '小説の編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])
    if @novel.destroy
      flash[:notice] = '小説を削除しました'
      redirect_to public_novels_path
    else
      flash.now[:notice] = '小説の削除に失敗しました'
      render :edit
    end
  end

  # 投稿データのストロングパラメータ
  private

  def novel_params
    params.require(:novel).permit(:title, :body, :genre_id)
  end

  def correct_user
    @novel = Novel.find(params[:id])
    @user = @novel.user
    redirect_to (public_novels_path) unless @user == current_user
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "ゲストユーザー"
      flash[:notice] = "ゲストユーザーは新規投稿画面へ遷移できません"
      redirect_to public_novels_path
    end
  end

end

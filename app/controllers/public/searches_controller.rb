class Public::SearchesController < ApplicationController

  def search
    # params[:range]は検索モデル,params[:search]は検索方法,params[:word]は検索ワード
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @novels = Novel.looks(params[:search], params[:word])
    end
  end
end

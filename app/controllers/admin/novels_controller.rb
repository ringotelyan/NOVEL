class Admin::NovelsController < ApplicationController
  def index
    @novels = Novel.all
  end

  def show
  end

  def edit
  end

  def destroy
  end
end

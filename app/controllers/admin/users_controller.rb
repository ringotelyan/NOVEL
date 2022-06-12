class Admin::UsersController < ApplicationController
  def index
    @User = User.all
  end

  def show
  end

  def edit
  end
end

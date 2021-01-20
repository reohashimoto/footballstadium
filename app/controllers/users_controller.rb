class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @matches = current_user.matches.order("created_at DESC").page(params[:page]).per(5)
  end
end

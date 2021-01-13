class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @matches = current_user.matches
  end
end

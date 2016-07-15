class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  #TODO implement edit / update for user attributes
  def edit

  end

  def update
  end
end

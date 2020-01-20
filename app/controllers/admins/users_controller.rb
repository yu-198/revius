class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@user = User.all
  end

  def show
  end

  def edit
  end

  def update
  end
end

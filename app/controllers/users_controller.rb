class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_deleted

  def show
  	@user = User.find(current_user.id)
  end

  def edit
  	@user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
  	if @user.update!(user_params)
  	  redirect_to user_path(current_user.id)
  	else
  	  render :edit
  	end
  end

  def leave
    @user = User.find(params[:id])
    @user.is_deleted = true
    @user.save
    redirect_to destroy_user_session_path
  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email)
  end
  def user_is_deleted
    if current_user.is_deleted?
      redirect_to root_path
    end
  end

end

class UsersController < ApplicationController
  def show
  	@user = User.find(current_user.id)
  end

  def edit
  	@user = User.find(current_user.id)
  end

  def update
  	if@user.update(user_params)
  	  redirect_to user_path(current_user.id)
  	else
  	  render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email)
  end
end

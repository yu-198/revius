class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@user = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "更新成功しました"
       redirect_to admins_users_path
    else
       flash[:danger] = "入力内容を確認してください"
       render :edit
    end
  end

  def available
    @user = User.find(params[:id])
    @user.is_deleted = false
    @user.save
    redirect_to admins_users_path
  end

  def unavailable
    @user = User.find(params[:id])
    @user.is_deleted = true
    @user.save
    redirect_to admins_users_path
  end

  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email)
    end
end

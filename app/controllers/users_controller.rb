class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_deleted

  before_action :ensure_current_user,{only:[:edit, :update]}
  before_action :baria_user

  def show
  	@user = User.find(current_user.id)
  end

  def edit
  	@user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
  	if @user.update(user_params)
      flash[:success] = "更新成功しました"
  	  redirect_to user_path(current_user.id)
  	else
      flash[:danger] = "入力内容を確認してください"
  	  render :edit
  	end
  end

  def leave
    @user = User.find(params[:id])
    @user.is_deleted = true
    @user.save
    flash[:success] = "#{@user.first_name}さん、今までありがとうございました！"
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

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  def baria_user
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user)
    end
  end

   #別のユーザーの編集をできないようにする
  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

end

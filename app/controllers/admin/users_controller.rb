class Admin::UsersController < ApplicationController
  before_action :login_first
  before_action :admin?
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    logger.debug "error:#{@user.attributes.inspect}"
    if @user.save
      flash.notice = "#{@user.name}を作成しました"
      redirect_to admin_users_path
    else
      render :new
    end
  end 

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      logger.debug "sessionID = #{session[:user_id].inspect}"
      flash.notice = "#{@user.name}がログインしました"

      redirect_to admin_users_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

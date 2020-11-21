class ApplicationController < ActionController::Base
    include ApplicationHelper

    def login_first
        unless session[:user_id]
          flash.notice = "ログインしてください"
          redirect_to root_path
        end
    end

    def admin?
      unless current_user.admin?
        flash.notice = "管理者権限が必要です"
        redirect_to root_path
      end
    end
end

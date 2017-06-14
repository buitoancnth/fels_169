class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      respond_to do |format|
        store_location
        message_please_login = t "message.please_login"
        format.html do
          flash[:danger] = message_please_login
          redirect_to login_path
        end
        format.json do
          render json: {message: message_please_login}, status: :unauthorized
        end
      end
    end
  end

  def not_logged_in
    if logged_in?
      respond_to do |format|
        format.html do
          flash[:danger] = t "message.please_logout"
          redirect_to root_path
        end
        format.json do
          render json: {message: t("please_logout")}, status: :bad_request
        end
      end
    end
  end

  def json_request?
    request.format.json?
  end
end

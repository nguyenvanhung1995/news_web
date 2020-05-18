# frozen_string_literal: true

module Admin
  class BaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout "admin"
    before_action :authenticate_user!
    before_action :authorize_admin

    def authorize_admin
      return if user_signed_in? && current_user.admin?

      redirect_to new_user_session_path
      flash[:danger] = "You must login with valid account !"
    end
  end
end

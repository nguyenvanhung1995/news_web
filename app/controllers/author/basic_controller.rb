# frozen_string_literal: true

module Author
  class BasicController < ActionController::Base
    protect_from_forgery with: :exception
    layout "admin"
    before_action :authenticate_user!
    before_action :authorize_author

    def authorize_author
      return if user_signed_in? && current_user.author?

      redirect_to new_user_session_path
      flash[:danger] = "You must login with valid account !"
    end
  end
end

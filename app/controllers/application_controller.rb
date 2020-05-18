# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def after_sign_in_path_for(resource)
    return unless user_signed_in?

    if current_user.user?
      source(root_path, resource)
    elsif current_user.admin?
      source(admin_root_path, resource)
    elsif current_user.author?
      source(author_posts_path, resource)
    end
  end

  def source(rolepath, resource)
    session[:forwarding_url] || stored_location_for(resource) || rolepath
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  rescue StandardError
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found, layout: false
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  helper_method :current_user

  private

  def user_not_authorized
    redirect_to(request.referer || root_path, notice: 'You are not authorized to perform this action.')
  end
end

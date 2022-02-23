# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  helper_method :current_user
end

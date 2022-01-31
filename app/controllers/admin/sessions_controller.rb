# frozen_string_literal: true

class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_be_admin, only: %i[new create]

  def new
    @user = User.new
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.authenticate(session_params[:password]) && @user.is_a?(Admin)
      session[:user_id] = @user.id

      redirect_to admin_events_path, notice: t('.success')
    else
      @user = User.new
      @user.errors.add(:password, t('.wrong'))

      render :new, status: :unauthorized
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end

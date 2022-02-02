# frozen_string_literal: true

class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_be_admin, only: %i[new create]

  def new
    @sign_in_form = SignInForm.new
  end

  def create
    @sign_in_form = SignInForm.new(session_params.merge(admin_form: true))

    if @sign_in_form.valid?
      sign_in @sign_in_form.user
      redirect_to admin_events_path, notice: t('.success')
    else
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def session_params
    params.require(:sign_in_form).permit(:email, :password)
  end
end

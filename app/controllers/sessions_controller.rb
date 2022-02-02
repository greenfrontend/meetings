# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @sign_in_form = SignInForm.new
  end

  def create
    @sign_in_form = SignInForm.new(session_params)

    if @sign_in_form.valid?
      sign_in @sign_in_form.user
      redirect_to root_path, notice: t('.success')
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

# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user_sign_in_form = UserSignInForm.new
  end

  def create
    @user_sign_in_form = UserSignInForm.new(session_params)

    if @user_sign_in_form.valid?
      sign_in @user_sign_in_form.user
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
    params.require(:user_sign_in_form).permit(:email, :password)
  end
end

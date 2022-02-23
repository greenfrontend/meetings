# frozen_string_literal: true

class ForgotPasswordsController < ApplicationController
  def new
    @forgot_password_form = ForgotPasswordForm.new
  end

  def create
    @forgot_password_form = ForgotPasswordForm.new(forgot_form_params)
    user = @forgot_password_form.user
    return redirect_to(:new_forgot_password, notice: t('.not_found')) unless user

    UserService.send_link_for_reset_password(user)

    redirect_to(:root, notice: t('.link_was_sent'))
  end

  private

  def forgot_form_params
    params.require(:forgot_password_form).permit(:email)
  end
end

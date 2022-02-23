# frozen_string_literal: true

class PasswordsController < ApplicationController
  def edit
    token = params[:token]

    user = find_user(token)
    return redirect_to(root_path, notice: t('.not_found')) unless user

    token_hours = time_diff_hours(Time.current, user.reset_password_token_created_at)
    expired = token_hours > 24
    return redirect_to(root_path, notice: t('.token_expired')) if expired

    @password = PasswordForm.new
  end

  def update
    @password = PasswordForm.new(password_params)
    return render(:edit) unless @password.valid?

    user = find_user(params[:token])
    return redirect_to(root_path, notice: t('.not_found')) unless user

    user.update({
                  password: @password.password,
                  reset_password_token: nil,
                  reset_password_token_created_at: nil
                })

    redirect_to(root_path, notice: t('.password_updated'))
  end

  private

  def password_params
    params.require(:password_form).permit(:password, :password_confirmation)
  end

  def find_user(token)
    User.find_by(reset_password_token: token)
  end

  def time_diff_hours(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs
    seconds_diff / 3600
  end
end

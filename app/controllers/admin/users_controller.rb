# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: %i[edit update]

    def index
      @users = User.page(params[:page]).per(10).order('id')
    end

    def new
      @user = User.new
    end

    def create
      password = SecureRandom.base58(32)
      password_params = {
        password:,
        password_confirmation: password
      }
      @user = User.new(users_params.merge(password_params))

      if @user.save
        UserService.send_link_for_reset_password(@user)
        redirect_to admin_users_path, notice: t('.success')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(users_params)
        redirect_to admin_users_path, notice: t('.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def users_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
    end
  end
end

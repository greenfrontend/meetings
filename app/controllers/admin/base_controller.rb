# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :require_be_admin

    private

    def require_be_admin
      redirect_to new_session_path, notice: t('admin.auth.should_be_admin') unless current_user&.admin?
    end
  end
end

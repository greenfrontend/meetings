# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :require_be_admin

  private

  def require_be_admin
    redirect_to new_admin_session_path, notice: t('should_be_admin') unless current_user&.admin?
  end
end

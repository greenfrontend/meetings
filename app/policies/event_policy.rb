# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  def destroy?
    @user.admin?
  end
end

# frozen_string_literal: true

class SignInForm
  include ActiveModel::Model

  attr_accessor :email, :password, :admin_form

  validates :email, presence: true
  validates :password, presence: true
  validate :user_exists, :user_can_sign_in, :check_admin

  def user_can_sign_in
    errors.add(:password, :cannot_sign_in) if password.present? && !@user&.authenticate(password)
  end

  def user_exists
    email.present? && user
  end

  def user
    @user ||= User.find_by(email:)
  end

  def check_admin
    errors.add(:email, :not_admin) if admin_form && !user.admin?
  end

  def email=(value)
    @email = value.downcase
  end
end

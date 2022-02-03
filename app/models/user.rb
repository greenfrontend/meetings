# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :events, dependent: :destroy

  def admin?
    role == 'Admin'
  end
end

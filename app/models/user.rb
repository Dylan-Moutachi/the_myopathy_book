class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :articles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address" }

  def is_admin?
    self.admin == true
  end
end

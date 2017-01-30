require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true
  validates_inclusion_of :admin, in: [true, false]
  validates :email, :username, uniqueness: true

  def admin?
    self.admin
  end
end

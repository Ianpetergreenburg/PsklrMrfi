require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  # validates :first_name, :last_name, :email, :username, presence: true
  # validates :email, :username, uniqueness: true
  # validates :payment_info, { numericality: true }
end

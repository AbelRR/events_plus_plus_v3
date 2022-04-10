class User < ApplicationRecord
  validates :email, uniqueness: true

  scope :admins, -> { where(user_role: 'admin') }
  scope :clients, -> { where(user_role: 'client') }
end

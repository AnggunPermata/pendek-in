class User < ApplicationRecord
    validates :full_name, presence: true
    validates :username, presence: true
    validates :password, confirmation: true, presence: true
    validates :password_confirmation, presence: true
  end
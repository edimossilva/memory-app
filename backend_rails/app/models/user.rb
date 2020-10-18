# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :memories, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 3 }

  enum access_level: { registred: 0, admin: 1 }

  def owner?(entity)
    entity.user == self
  end

  def self.from_omniauth(auth)
    where(username: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         :omniauthable, omniauth_providers: %i(google)

  mount_uploader :icon, ImageUploader

  def self.create_unique_string
    SecureRandom.uuid
  end
end

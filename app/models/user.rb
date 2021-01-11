class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :icon, ImageUploader
  
  def self.create_unique_string
    SecureRandom.uuid
  end
end

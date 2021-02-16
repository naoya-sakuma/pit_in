class Community < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :member_users, through: :favorites, source: :user
  validates :title, presence: true
end

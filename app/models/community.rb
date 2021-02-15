class Community < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :members, dependent: :destroy
  validates :title, presence: true
end

class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems

  validates :title,  presence: true
end

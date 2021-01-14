class Problem < ApplicationRecord
  belongs_to :goal
  has_many :solutions

  validates :title,  presence: true
end

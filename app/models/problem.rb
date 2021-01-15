class Problem < ApplicationRecord
  belongs_to :goal, inverse_of: :problems
  has_many :solutions

  validates :title,  presence: true
end

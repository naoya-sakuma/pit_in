class Solution < ApplicationRecord
  belongs_to :problem, inverse_of: :solutions
  has_many :tasks

  validates :title,  presence: true
end

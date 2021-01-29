class Solution < ApplicationRecord
  belongs_to :problem, inverse_of: :solutions
  has_many :tasks, inverse_of: :solution, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true
end

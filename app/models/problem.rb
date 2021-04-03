class Problem < ApplicationRecord
  belongs_to :goal, inverse_of: :problems
  has_many :solutions, dependent: :destroy
  accepts_nested_attributes_for :solutions, allow_destroy: true
  validates :title, presence: true
end

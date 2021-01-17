class Problem < ApplicationRecord
  belongs_to :goal, inverse_of: :problems
  has_many :solutions, inverse_of: :problem, dependent: :destroy
  accepts_nested_attributes_for :solutions, reject_if: proc { |attributes| attributes['title'].blank?}

  validates :title,  presence: true
end

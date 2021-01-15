class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, inverse_of: :goal, dependent: :destroy
  accepts_nested_attributes_for :problems, reject_if: proc { |attributes| attributes['title'].blank?}

  validates :title,  presence: true
end

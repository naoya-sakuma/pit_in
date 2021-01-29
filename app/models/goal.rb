class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  accepts_nested_attributes_for :problems, allow_destroy: true#, reject_if: proc { |attributes| attributes['title'].blank? and attributes['working'].blank?}

  validates :title,  presence: true

  # has_many :problems, inverse_of: :goal, dependent: :destroy
  # accepts_nested_attributes_for :problems, reject_if: proc { |attributes| attributes['title'].blank?}
end

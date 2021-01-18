class Task < ApplicationRecord
  #belongs_to :user
  belongs_to :solution, inverse_of: :tasks
  has_many :steps, inverse_of: :task, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['title'].blank?}

  validates :title,  presence: true
end

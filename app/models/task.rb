class Task < ApplicationRecord
  #belongs_to :user
  belongs_to :solution, inverse_of: :tasks
  has_many :steps, inverse_of: :task, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :title,  presence: true
end

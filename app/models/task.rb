class Task < ApplicationRecord
  belongs_to :solution, inverse_of: :tasks
  #has_many :steps, inverse_of: :task, dependent: :destroy
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  validates :title, presence: true
end

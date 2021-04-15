class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  has_many :solutions, through: :problems
  has_many :tasks, through: :solutions
  has_many :steps, through: :tasks
  accepts_nested_attributes_for :problems, allow_destroy: true
  validates :title, presence: true
end

class Task < ApplicationRecord
  #belongs_to :user
  belongs_to :solution, inverse_of: :tasks
  has_many :tasks

  validates :title,  presence: true
end

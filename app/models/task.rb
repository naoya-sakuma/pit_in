class Task < ApplicationRecord
  belongs_to :user
  belongs_to :solution
  has_many :tasks

  validates :title,  presence: true
end

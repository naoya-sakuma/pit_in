class Step < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :title,  presence: true
end

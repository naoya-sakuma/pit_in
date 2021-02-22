class Step < ApplicationRecord
  #belongs_to :user
  belongs_to :task, inverse_of: :steps
  validates :title, presence: true
end

class Step < ApplicationRecord
  #belongs_to :user
  belongs_to :task, inverse_of: :steps
end

class Task < ApplicationRecord
  #belongs_to :user
  belongs_to :solution, inverse_of: :tasks
  has_many :steps, inverse_of: :task, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  # accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :reject_create_step
  # def reject_create_step(steps_attributes)
  #   title_empty = steps_attributes[:title].blank?
  #   status_empty = steps_attributes[:status].blank?
  #   steps_attributes.merge!(_destroy: '1') if title_empty && status_empty
  # end
end

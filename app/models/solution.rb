class Solution < ApplicationRecord
  belongs_to :problem, inverse_of: :solutions
  has_many :tasks, inverse_of: :solution, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :reject_create_task

  def reject_create_task(tasks_attributes)
    title_empty = tasks_attributes[:title].blank?
    status_empty = tasks_attributes[:status].blank?
    tasks_attributes.merge!(_destroy: '1') if title_empty && status_empty
  end
end

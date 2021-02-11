class Problem < ApplicationRecord
  belongs_to :goal, inverse_of: :problems
  has_many :solutions, inverse_of: :problem, dependent: :destroy
  accepts_nested_attributes_for :solutions, allow_destroy: true#, reject_if: :reject_create_solution

  def reject_create_solution(solutions_attributes)
    title_empty = solutions_attributes[:title].blank?
    status_empty = solutions_attributes[:status].blank?
    solutions_attributes.merge!(_destroy: '1') if title_empty && status_empty
  end
end

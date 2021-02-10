class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  accepts_nested_attributes_for :problems, allow_destroy: true, reject_if: :reject_create_problem
  validates :title,  presence: true

  def reject_create_problem(problems_attributes)
    title_empty = problems_attributes[:title].blank?
    status_empty = problems_attributes[:status].blank?
    problems_attributes.merge!(_destroy: '1') if title_empty && status_empty
  end
end

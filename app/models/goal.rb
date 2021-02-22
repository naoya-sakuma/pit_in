class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  has_many :solutions, through: :problems
  has_many :tasks, through: :solutions
  accepts_nested_attributes_for :problems, allow_destroy: true
  validates :title,  presence: true

  validate :require_problems

  def require_problems
    errors.add(:base, :no_problem) if problems.blank?
  end

  # accepts_nested_attributes_for :problems, allow_destroy: true, reject_if: :reject_create_problem
  # def reject_create_problem(problems_attributes)
  #   title_empty = problems_attributes[:title].blank?
  #   status_empty = problems_attributes[:status].blank?
  #   problems_attributes.merge!(_destroy: '1') if title_empty && status_empty
  # end
end

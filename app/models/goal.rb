class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  #accepts_nested_attributes_for :problems, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :problems, allow_destroy: true, reject_if: :reject_create_problem
  #accepts_nested_attributes_for :problems, allow_destroy: true

  def reject_create_problem(problems_attributes)
    title_empty = problems_attributes[:title].blank?
    status_empty = problems_attributes[:status].blank?
    problems_attributes.merge!(_destroy: '1') if title_empty && status_empty
    #binding.pry
  end



  validates :title,  presence: true

  def self.csv_attributes
    ["title", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |goal|
        csv << csv_attributes.map{ |attr| goal.send(attr) }
      end
    end
  end
end

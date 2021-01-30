class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  accepts_nested_attributes_for :problems, allow_destroy: true

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

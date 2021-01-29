class Goal < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  accepts_nested_attributes_for :problems, allow_destroy: true

  validates :title,  presence: true
end

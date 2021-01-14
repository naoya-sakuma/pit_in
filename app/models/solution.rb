class Solution < ApplicationRecord
  belongs_to :problem
  has_many :tasks

  validates :title,  presence: true
end

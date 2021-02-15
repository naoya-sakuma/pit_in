class Comment < ApplicationRecord
  belongs_to :community
  validates :content, presence: true
end

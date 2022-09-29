class Link < ApplicationRecord
  validates :link, presence: true, length: {minimum: 3, maximum: 20}
  belongs_to :user
end
class Link < ApplicationRecord
  validates :link, presence: true, length: {minimum: 3, maximum: 20}
  belongs_to :user
  has_many :link_categories
  has_many :categories, through: :link_categories
end
class Category < ApplicationRecord
  acts_as_nested_set
  has_many :blogs

  validates :name, presence: true
end

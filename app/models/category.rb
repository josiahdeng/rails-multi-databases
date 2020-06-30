class Category < ApplicationRecord
  acts_as_nested_set :counter_cache => :children_count,
                     :order_column => :lft
  has_many :blogs

  validates :name, presence: true
end

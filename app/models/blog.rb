class Blog < ApplicationRecord
  belongs_to :writer, :class_name => 'Writer::Writer'
  belongs_to :category
end
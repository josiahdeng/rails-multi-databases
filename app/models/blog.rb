class Blog < ApplicationRecord
  belongs_to :writer, :class_name => 'Writer::Writer'
end
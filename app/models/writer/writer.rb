class Writer::Writer < Writer::ApplicationRecord
  has_many :blogs
  self.table_name = "#{WRITER_DATABASE["database"]}.writers"
end
class Writer::Writer < Writer::ApplicationRecord
  has_many :blogs
  before_create "created_at = DateTime.now"
  before_save "updated_at = DateTime.now"
end
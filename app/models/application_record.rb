class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  acts_as_paranoid column: :deleted, sentinel_value: false

  def paranoia_restore_attributes
    {
        deleted: false
    }
  end

  def paranoia_destroy_attributes
    {
        deleted: true
    }
  end
end

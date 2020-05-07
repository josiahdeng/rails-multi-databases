class Writer::ApplicationRecord < ApplicationRecord
  self.abstract_class = true

  establish_connection(WRITER_DATABASE)
end
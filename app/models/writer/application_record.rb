class Writer::ApplicationRecord < ApplicationRecord
  self.abstract_class = true

  def self.table_name_prefix
    database_name = WRITER_DATABASE['database']
    "#{database_name}."
  end


  establish_connection(WRITER_DATABASE)
end
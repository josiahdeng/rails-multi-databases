class AddCreatedAtToWriter < ActiveRecord::Migration[5.0]
  def connection
    ActiveRecord::Base.establish_connection(WRITER_DATABASE).connection
  end

  def change
    add_column :writers, :created_at, :datetime
    add_column :writers, :updated_at, :datetime
  end
end
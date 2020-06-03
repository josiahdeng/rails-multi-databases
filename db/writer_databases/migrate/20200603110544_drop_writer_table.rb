class DropWriterTable < ActiveRecord::Migration[5.0]
  def connection
    ActiveRecord::Base.establish_connection(WRITER_DATABASE).connection
  end

  drop_table :writers

  def change
    create_table :writers do |t|
      t.string :name
      t.timestamps
      t.boolean :deleted
    end
  end
end
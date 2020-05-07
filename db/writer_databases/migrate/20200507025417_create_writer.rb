class CreateWriter < ActiveRecord::Migration[5.0]
  def connection
    ActiveRecord::Base.establish_connection(WRITER_DATABASE).connection
  end

  def change
    create_table :writers do |t|
      t.string :name
      t.boolean :deleted
    end
  end
end

class CreateBlog < ActiveRecord::Migration[5.0]

  def change
    create_table :blogs do |t|
      t.integer :writer_id
      t.string :name
      t.boolean :deleted
    end
  end
end

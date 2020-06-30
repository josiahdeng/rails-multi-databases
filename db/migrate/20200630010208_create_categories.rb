class CreateCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id,:index => true
      t.integer :lft, :index => true
      t.integer :rgt, :index => true

      # optional fields
      t.integer :depth, :default => 0
      # t.integer :children_count, :default => 0
      t.boolean :deleted, default: false, index: true
    end
  end

  def self.down
    drop_table :categories
  end
end

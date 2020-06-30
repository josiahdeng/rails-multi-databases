class AddChildrenCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :children_count, :integer, default: 0
  end
end

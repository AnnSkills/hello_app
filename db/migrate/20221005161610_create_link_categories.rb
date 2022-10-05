class CreateLinkCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :link_categories do |t|
      t.integer :link_id
      t.integer :category_id
    end
  end
end

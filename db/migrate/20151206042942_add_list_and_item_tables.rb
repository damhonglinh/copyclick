class AddListAndItemTables < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :title

      t.timestamps
    end

    create_table :items do |t|
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end

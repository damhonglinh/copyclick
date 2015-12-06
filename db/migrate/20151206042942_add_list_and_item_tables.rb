class AddListAndItemTables < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :title

      t.timestamps
    end

    create_table :items do |t|
      t.integer :content
      t.integer :position

      t.timestamps
    end
  end
end

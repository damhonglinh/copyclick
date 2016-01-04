class AddHandleColumnToLists < ActiveRecord::Migration
  def change
    add_column :lists, :handle, :string, null: false, default: ''
    add_index :lists, :handle, unique: true
  end
end

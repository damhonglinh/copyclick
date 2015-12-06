class AddListIdColumnToItem < ActiveRecord::Migration
  def change
    add_reference :items, :list, index: true
  end
end

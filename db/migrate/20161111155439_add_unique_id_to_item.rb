class AddUniqueIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :uniqueid, :string
  end
end

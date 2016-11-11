class DropMediaTypesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :media_types
  end
end

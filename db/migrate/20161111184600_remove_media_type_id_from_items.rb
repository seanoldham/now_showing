class RemoveMediaTypeIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :media_type_id, :integer
  end
end

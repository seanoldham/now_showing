class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.references :media_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :maker
      t.text :image_url
      t.references :user, index: true
      t.timestamps
    end
  end
end

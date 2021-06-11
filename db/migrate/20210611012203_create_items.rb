class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.belongs_to :user, null: false, foreign_key: true
      t.string :description
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end

class CreateErrands < ActiveRecord::Migration
  def change
    create_table :errands do |t|
      t.string :title
      t.string :item_name
      t.float :price
      t.string :store

      t.timestamps null: false
    end
  end
end

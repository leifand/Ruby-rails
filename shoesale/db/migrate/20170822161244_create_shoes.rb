class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :description
      t.decimal :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

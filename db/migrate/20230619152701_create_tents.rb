class CreateTents < ActiveRecord::Migration[7.0]
  def change
    create_table :tents do |t|
      t.string :name
      t.text :description
      t.boolean :availability
      t.string :address
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

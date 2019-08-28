class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end

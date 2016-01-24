class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :slug
      t.string :model_type_code
      t.integer :base_price
      t.integer :model_id

      t.timestamps null: false
    end
    add_index :model_types, :slug, unique: true
  end
end

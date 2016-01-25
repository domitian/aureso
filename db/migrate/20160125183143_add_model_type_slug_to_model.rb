class AddModelTypeSlugToModel < ActiveRecord::Migration
  def change
    add_column :model_types, :model_type_slug, :string
    add_index :model_types, :model_type_slug, unique: true
  end
end

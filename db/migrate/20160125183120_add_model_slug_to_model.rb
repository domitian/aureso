class AddModelSlugToModel < ActiveRecord::Migration
  def change
    add_column :models, :model_slug, :string
    add_index :models,:model_slug, unique: true
  end
end

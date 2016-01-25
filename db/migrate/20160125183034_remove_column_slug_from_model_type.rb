class RemoveColumnSlugFromModelType < ActiveRecord::Migration
  def change
    remove_column :model_types, :slug, :string
  end
end

class RemoveColumnSlugFromModel < ActiveRecord::Migration
  def change
      remove_column :models, :slug, :string
  end
end

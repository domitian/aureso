class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :public_name
      t.string :type
      t.string :pricing_policy

      t.timestamps null: false
    end
  end
end

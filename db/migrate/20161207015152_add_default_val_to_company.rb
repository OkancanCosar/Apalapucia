class AddDefaultValToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :slug, :string
    add_index :companies, :slug, unique: true
    add_column :companies, :name, :string
    add_column :companies, :bio, :text
  end
end

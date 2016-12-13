class AddDefaultValToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :slug, :string
    add_index :members, :slug, unique: true
    add_column :members, :name, :string
    add_column :members, :lastname, :string
    add_column :members, :phone, :string
    add_column :members, :facebook_url, :string
    add_column :members, :twitter_url, :string
  end
end

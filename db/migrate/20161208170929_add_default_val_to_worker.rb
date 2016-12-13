class AddDefaultValToWorker < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :slug, :string
    add_index :workers, :slug, unique: true
    add_column :workers, :name, :string
    add_column :workers, :lastname, :string
    add_column :workers, :confirmation, :boolean
    add_column :workers, :description, :text
    add_reference :workers, :company, foreign_key: true
  end
end

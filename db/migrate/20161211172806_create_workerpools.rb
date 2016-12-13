class CreateWorkerpools < ActiveRecord::Migration[5.0]
  def change
    create_table :workerpools do |t|
      t.boolean :status
      t.references :company, foreign_key: true
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end

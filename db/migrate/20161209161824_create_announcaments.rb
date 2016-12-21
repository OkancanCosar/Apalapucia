class CreateAnnouncaments < ActiveRecord::Migration[5.0]
  def change
    create_table :announcaments do |t|
      t.string :city
      t.integer :req_count
      t.text :body
      t.references :company, foreign_key: true
      t.references :worker, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end

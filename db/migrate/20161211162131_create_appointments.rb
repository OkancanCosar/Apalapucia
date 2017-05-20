class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.text :body
      t.references :season, foreign_key: true
      t.references :member, foreign_key: true
      t.references :announcament, foreign_key: true

      t.timestamps
    end
  end
end

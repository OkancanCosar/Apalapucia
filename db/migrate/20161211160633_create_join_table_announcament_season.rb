class CreateJoinTableAnnouncamentSeason < ActiveRecord::Migration[5.0]
  def change
    create_join_table :announcaments, :seasons do |t|
      t.index [:announcament_id, :season_id]
      t.index [:season_id, :announcament_id]
    end
  end
end

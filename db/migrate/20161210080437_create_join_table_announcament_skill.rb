class CreateJoinTableAnnouncamentSkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :announcaments, :skills do |t|
       t.index [:announcament_id, :skill_id]
       t.index [:skill_id, :announcament_id]
    end
  end
end

class CreateJoinTableWorkerSkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :workers, :skills do |t|
       t.index [:worker_id, :skill_id]
       t.index [:skill_id, :worker_id]
    end
  end
end

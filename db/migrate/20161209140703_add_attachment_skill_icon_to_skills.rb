class AddAttachmentSkillIconToSkills < ActiveRecord::Migration
  def self.up
    change_table :skills do |t|
      t.attachment :skill_icon
    end
  end

  def self.down
    remove_attachment :skills, :skill_icon
  end
end

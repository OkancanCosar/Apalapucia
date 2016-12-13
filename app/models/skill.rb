class Skill < ApplicationRecord
  has_and_belongs_to_many :workers, dependent: :nullify
  has_and_belongs_to_many :members, dependent: :nullify
  has_and_belongs_to_many :announcament, dependent: :nullify

  has_attached_file :skill_icon, styles: { medium: "400x150#" }
  validates_attachment_content_type :skill_icon, content_type: /\Aimage\/.*\Z/
end

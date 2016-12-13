class Announcament < ApplicationRecord
  belongs_to :company
  belongs_to :worker
  has_and_belongs_to_many :skill, dependent: :nullify
  has_and_belongs_to_many :season, dependent: :nullify
  has_many :appointment, dependent: :nullify

end

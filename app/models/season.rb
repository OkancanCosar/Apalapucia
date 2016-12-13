class Season < ApplicationRecord

  # worker bağlama
  belongs_to :workers

  has_many :appointment, dependent: :nullify

  has_and_belongs_to_many :announcament, dependent: :nullify
end

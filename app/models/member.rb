class Member < ApplicationRecord

  has_and_belongs_to_many :skills, dependent: :nullify

  has_many :appointment, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class Company < ApplicationRecord

  # workers tablosu ilişkisi
  has_many :workers, dependent: :nullify

  # ilan tablo ilişkisi
  has_many :announcaments, dependent: :nullify

  # Workerpool tablo ilişkisi
  has_many :workerpools, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# for paperclip
  has_attached_file :company_poster
  validates_attachment_content_type :company_poster, content_type: /\Aimage\/.*\Z/

# for paperclip
  has_attached_file :company_icon
  validates_attachment_content_type :company_icon, content_type: /\Aimage\/.*\Z/

end

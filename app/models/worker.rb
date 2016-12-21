class Worker < ApplicationRecord

  # trigger for worker x workerpool
  trigger.after(:insert) do
    "INSERT INTO workerpools (status, company_id, worker_id,created_at,updated_at) VALUES
                        (false, NEW.company_id, NEW.id, NEW.created_at, NEW.created_at );"
  end

  # company ilişkisi
  belongs_to :company

  # worker ilişkisi
  has_many :announcaments, dependent: :nullify

  # skill many-to-many
  has_and_belongs_to_many :skills, dependent: :nullify

  # season bağlantısı
  has_many :seasons, dependent: :nullify

  # workerpool işlemi
  has_many :workerpools, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # for paperclip
  has_attached_file :worker_image, styles: { medium: "90x90#", small: "20x20#"}
  validates_attachment_content_type :worker_image, content_type: /\Aimage\/.*\Z/

end

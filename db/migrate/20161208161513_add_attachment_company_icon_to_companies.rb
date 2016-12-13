class AddAttachmentCompanyIconToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :company_icon
    end
  end

  def self.down
    remove_attachment :companies, :company_icon
  end
end

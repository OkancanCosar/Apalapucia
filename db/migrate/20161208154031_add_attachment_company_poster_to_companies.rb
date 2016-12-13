class AddAttachmentCompanyPosterToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :company_poster
    end
  end

  def self.down
    remove_attachment :companies, :company_poster
  end
end

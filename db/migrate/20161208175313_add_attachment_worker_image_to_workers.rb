class AddAttachmentWorkerImageToWorkers < ActiveRecord::Migration
  def self.up
    change_table :workers do |t|
      t.attachment :worker_image
    end
  end

  def self.down
    remove_attachment :workers, :worker_image
  end
end

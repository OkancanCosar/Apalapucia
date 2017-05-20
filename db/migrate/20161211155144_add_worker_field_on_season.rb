class AddWorkerFieldOnSeason < ActiveRecord::Migration[5.0]
  def change
    add_column :seasons, :worker_id, :integer
    add_index  :seasons, :worker_id
  end
end

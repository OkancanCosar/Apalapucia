class ChangeAvailabilityDefVal < ActiveRecord::Migration[5.0]
  def change
    change_column_default :announcaments_seasons, :availability, true
  end
end

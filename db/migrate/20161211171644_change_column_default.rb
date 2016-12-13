class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
     change_column_default :workers, :confirmation, false
  end
end

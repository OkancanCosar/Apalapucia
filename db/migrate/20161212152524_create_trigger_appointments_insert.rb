# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerAppointmentsInsert < ActiveRecord::Migration
  def up
    create_trigger("appointments_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("appointments").
        after(:insert) do
      <<-SQL_ACTIONS
UPDATE announcaments_seasons SET availability = false WHERE
      announcament_id = NEW.announcament_id AND season_id = NEW.season_id;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("appointments_after_insert_row_tr", "appointments", :generated => true)
  end
end

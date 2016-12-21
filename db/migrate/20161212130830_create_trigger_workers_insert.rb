# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerWorkersInsert < ActiveRecord::Migration
  def up
    drop_trigger("workers_after_insert_row_tr", "workers", :generated => true)

    create_trigger("workers_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("workers").
        after(:insert) do
      <<-SQL_ACTIONS
INSERT INTO workerpools (status, company_id, worker_id,created_at,updated_at) VALUES
                        (false, NEW.company_id, NEW.id, NEW.created_at, NEW.created_at );
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("workers_after_insert_row_tr", "workers", :generated => true)

    create_trigger("workers_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("workers").
        after(:insert) do
      <<-SQL_ACTIONS
INSERT INTO workerpool (status, company_id, worker_id,created_at,updated_at) VALUES
                        (false, NEW.company_id, NEW.id, NEW.created_at, NEW.created_at );
      SQL_ACTIONS
    end
  end
end

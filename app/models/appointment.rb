class Appointment < ApplicationRecord
  belongs_to :season
  belongs_to :member
  belongs_to :announcament

  # trigger for announcament x seasons
  trigger.after(:insert) do
    "UPDATE announcaments_seasons SET availability = false WHERE
      announcament_id = NEW.announcament_id AND season_id = NEW.season_id;"
  end
  
end

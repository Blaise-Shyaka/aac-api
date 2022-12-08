class AddRegistrationToYouthCampRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_reference :youth_camp_registrations, :registration, null: false, foreign_key: true
  end
end

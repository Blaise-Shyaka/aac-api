class CreateYouthCampRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :youth_camp_registrations do |t|
      t.string :full_name, null: false
      t.string :sex, null: false
      t.datetime :birth_date, null: false

      t.timestamps
    end
  end
end

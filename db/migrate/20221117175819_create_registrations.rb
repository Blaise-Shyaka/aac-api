class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :country, null: false
      t.string :phone_number, null: false
      t.string :passport_number, null: false
      t.string :email, null: false
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end
  end
end

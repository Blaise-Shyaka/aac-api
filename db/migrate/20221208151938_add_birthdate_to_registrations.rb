class AddBirthdateToRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_column :registrations, :birth_date, :datetime
    add_column :registrations, :sex, :string
  end
end

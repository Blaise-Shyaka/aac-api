class AddConventionToRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_reference :registrations, :convention
  end
end

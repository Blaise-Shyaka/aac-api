class ChangeNullConstraintOnYouthCamps < ActiveRecord::Migration[6.1]
  def change
    change_column_null :youth_camp_registrations, :full_name, true
    change_column_null :youth_camp_registrations, :birth_date, true
    change_column_null :youth_camp_registrations, :sex, true
  end
end

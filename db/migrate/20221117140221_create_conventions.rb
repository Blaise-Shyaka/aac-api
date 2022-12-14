class CreateConventions < ActiveRecord::Migration[6.1]
  def change
    create_table :conventions do |t|
      t.string :title, null: false
      t.string :theme, null: false
      t.boolean :active, null:false, default: false

      t.timestamps
    end
  end
end

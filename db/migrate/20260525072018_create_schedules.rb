class CreateSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :schedules do |t|
      t.references :departing_airport, null: false, foreign_key: { to_table: :airports }, index: true
      t.references :departing_flights, null: false, foreign_key: { to_table: :flights }, index: true

      t.timestamps
    end
  end
end

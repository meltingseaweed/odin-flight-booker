class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :departure_airport
      t.string :arrival_airport
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end

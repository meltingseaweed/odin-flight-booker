class CreateArrivals < ActiveRecord::Migration[8.1]
  def change
    create_table :arrivals do |t|
      t.references :arriving_airport, null: false, foreign_key: { to_table: :airports }, index: true
      t.references :arriving_flights, null: false, foreign_key: { to_table: :flights }, index: true

      t.timestamps
    end
  end
end

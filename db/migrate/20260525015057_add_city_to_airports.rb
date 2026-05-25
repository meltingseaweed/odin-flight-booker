class AddCityToAirports < ActiveRecord::Migration[8.1]
  def change
    add_column :airports, :city, :string
  end
end

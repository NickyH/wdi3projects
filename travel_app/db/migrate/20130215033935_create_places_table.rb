class CreatePlacesTable < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :area
      t.text :city
      t.text :country
      t.timestamps
    end
  end
end



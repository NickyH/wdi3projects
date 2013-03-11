class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :tripname
      t.text :destination
      t.text :activites
      t.date :tripstart
      t.date :tripend
      t.integer :user_id
      t.timestamps
    end
  end
end

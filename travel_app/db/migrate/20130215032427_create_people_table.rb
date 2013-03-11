class CreatePeopleTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :image
      t.text :bio
      t.text :connections
      t.text :activity
      t.text :currently
      t.text :trips
      t.integer :places_id
      t.timestamps
    end
  end
end




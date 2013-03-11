class CreateActivitiesTable < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :type
      t.integer :places_id
      t.timestamps
    end
  end
end

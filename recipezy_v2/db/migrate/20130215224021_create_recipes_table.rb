class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :key_ingredient
      t.text :preptime
      t.text :cooktime
      t.text :image
      t.text :instructions
      t.integer :servings
      t.timestamps
    end
  end
end

class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.integer :amount
      t.string :measurement
      t.string :name
      t.references :recipe

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end

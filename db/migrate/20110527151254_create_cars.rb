class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :vin
      t.string :stock_number
      t.integer :dirty
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end

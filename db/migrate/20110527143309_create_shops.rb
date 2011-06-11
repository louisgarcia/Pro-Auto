class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :fax
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end

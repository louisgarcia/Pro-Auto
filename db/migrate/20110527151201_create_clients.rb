class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :business_name
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :fax
      t.string :website
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end

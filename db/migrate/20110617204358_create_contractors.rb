class CreateContractors < ActiveRecord::Migration
  def self.up
    drop_table :contractors
    create_table :contractors do |t|
      t.string :first_name
        t.string :last_name
        t.string :street_address
        t.string :city
        t.string :state
        t.integer :zip
        t.string :phone
        t.string :email
        t.date :start_date
        t.date :end_date
        t.string :title
        
      t.timestamps
    end
  end

  def self.down
    drop_table :contractors
  end
end

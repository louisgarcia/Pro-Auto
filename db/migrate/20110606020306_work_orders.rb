class WorkOrders < ActiveRecord::Migration
  def self.up
    create_table :work_orders do |t|
      t.references :shop
      t.references :client
      t.string :stock_number
      t.references :make
      t.references :model
      t.string :year
      t.string :vin
      t.integer :priority
      t.integer :dirty
      t.text :notes
      t.string :status
      t.datetime :created
      t.datetime :received
      t.datetime :started
      t.datetime :finished
      t.datetime :delivered

      t.timestamps
    end
  end

  def self.down
    drop_table :work_orders
  end
end

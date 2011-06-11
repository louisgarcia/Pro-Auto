class DropWorkOrders < ActiveRecord::Migration
  def self.up
    drop_table :work_orders
  end

  def self.down
  end
end

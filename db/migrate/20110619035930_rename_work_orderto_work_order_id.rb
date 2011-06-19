class RenameWorkOrdertoWorkOrderId < ActiveRecord::Migration
  def self.up
    add_column :add_ons, :work_order_id, :integer
    remove_column :add_ons, :work_order
  end

  def self.down
  end
end

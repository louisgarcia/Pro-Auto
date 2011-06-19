class AddWorkOrderToAddOnJobs < ActiveRecord::Migration
  def self.up
    add_column :add_ons, :work_order, :integer
  end

  def self.down
  end
end

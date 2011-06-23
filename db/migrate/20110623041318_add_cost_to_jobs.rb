class AddCostToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :cost, :integer
  end

  def self.down
  end
end

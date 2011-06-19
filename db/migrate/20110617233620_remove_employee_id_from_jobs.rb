class RemoveEmployeeIdFromJobs < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :employee_id, :integer
    drop_table :employees
  end

  def self.down
  end
end

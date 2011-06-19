class RenameEmployeeToContractor < ActiveRecord::Migration
  def self.up
    add_column :jobs, :contractor_id, :integer
    
  end

  def self.down
  end
end

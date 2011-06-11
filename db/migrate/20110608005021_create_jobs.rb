class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :employee
      t.references :work_order
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end

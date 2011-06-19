class AddCostToModels < ActiveRecord::Migration
  def self.up
    add_column :models, :cost, :integer
  end

  def self.down
  end
end

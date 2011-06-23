class AddPriceToModels < ActiveRecord::Migration
  def self.up
    add_column :models, :price, :integer
  end

  def self.down
  end
end

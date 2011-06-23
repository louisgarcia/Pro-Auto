class AddPricetoAddons < ActiveRecord::Migration
  def self.up
    add_column :add_ons, :price, :integer
  end

  def self.down
  end
end

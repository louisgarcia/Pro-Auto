class Contractor < ActiveRecord::Base
  belongs_to :shop
  has_many :work_orders
  has_many :jobs
end

class Shop < ActiveRecord::Base
  has_many :employees
  has_many :work_orders
  has_many :cars
  has_many :clients
end

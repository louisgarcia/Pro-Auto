class Client < ActiveRecord::Base
  has_many :work_orders
  belongs_to :shop
end

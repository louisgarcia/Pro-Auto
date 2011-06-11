class Make < ActiveRecord::Base
  has_many :models
  has_many :work_orders
end

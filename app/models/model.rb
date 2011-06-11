class Model < ActiveRecord::Base
  belongs_to :make
  has_many :work_orders
end

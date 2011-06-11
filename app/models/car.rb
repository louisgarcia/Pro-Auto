class Car < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :client
end

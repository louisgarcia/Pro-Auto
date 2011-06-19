class Job < ActiveRecord::Base
  belongs_to :contractor
  belongs_to :work_order
end

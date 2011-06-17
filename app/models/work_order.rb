class WorkOrder < ActiveRecord::Base
  belongs_to :shop
  belongs_to :client
  belongs_to :make
  belongs_to :model
  has_many :jobs
  accepts_nested_attributes_for :jobs, :allow_destroy => true, :reject_if => lambda { |a| a[:employee_id].blank? }
  
  validates :shop, :presence => true
  validates :client, :presence => true
  validates :make, :presence => true
  validates :model, :presence => true 

  named_scope :all
  
  named_scope :inventory, :conditions => { :status => ["Received", "Started","Finished"]}
  named_scope :received, :conditions => { :status => "Received" }
  named_scope :started, :conditions => { :status => "Started" }
  named_scope :finished, :conditions => { :status => "Finished" }
  named_scope :delivered, :conditions => { :status => "Delivered" }
  named_scope :news, :conditions => { :status => "New" }
  
  FILTERS = [
  {:scope => "all",         :label => "All"},
  {:scope => "news",         :label => "New"},
  {:scope => "inventory",         :label => "-- Inventory"},
  {:scope => "received",      :label => "---- Received"},
  {:scope => "started",    :label => "---- Started"},
  {:scope => "finished",     :label => "---- Finished"},
  {:scope => "delivered",   :label => "Delivered"},
]


end

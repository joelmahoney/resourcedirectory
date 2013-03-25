class BusinessType < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :locations
  has_many :organizations
  
  def results_in_set(locations_set)
    (self.locations & locations_set).try(:size)
  end
end

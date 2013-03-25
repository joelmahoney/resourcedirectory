class Organization < ActiveRecord::Base  
  has_many :locations, :dependent => :destroy, :order => :address
  has_and_belongs_to_many :users, :uniq => true

  geocoded_by :full_address  
  
  attr_accessible :address, :city, :description, :email, :latitude, :longitude, :name, :phone, :population, :website, :zipcode, :contact
  
  after_validation :geocode
  
  def full_address
    [address, city, zipcode].compact.join(', ')
  end
end

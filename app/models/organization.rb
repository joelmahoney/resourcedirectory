class Organization < ActiveRecord::Base  
  has_many :locations, :dependent => :destroy, :order => :address
  has_and_belongs_to_many :users, :uniq => true

  geocoded_by :full_address
  
  attr_accessible :address, :city, :description, :email, :latitude, :longitude, :name, :phone, :population, :website, :zipcode, :contact
  
  after_validation :geocode
  before_save :strip_url
  
  def full_address
    [address, city, zipcode].compact.join(', ')
  end

  private
  def strip_url
    if self.website.present?
      self.website = website.gsub(/http:\/\//, '').gsub(/https:\/\//, '')
    end
  end
end

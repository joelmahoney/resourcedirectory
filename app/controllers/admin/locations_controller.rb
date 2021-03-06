class Admin::LocationsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :load_variables
  load_and_authorize_resource
  
  def index
    @locations = @organization.locations

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])
    @location.organization = @organization
    params[:location][:service_ids] ||= []
    params[:location][:business_type_ids] ||= []
    params[:location][:service_delivery_option_ids] ||= []
    
    respond_to do |format|
      if @location.save
        format.html { redirect_to admin_organization_locations_url(@organization), notice: 'Location was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @location = Location.find(params[:id])
    params[:location][:organization_id] = @organization.id
    params[:location][:service_ids] ||= []
    params[:location][:business_type_ids] ||= []
    params[:location][:service_delivery_option_ids] ||= []
    
    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to admin_organization_locations_path(@organization), notice: 'Location was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to admin_organization_locations_url(@organization) }
    end
  end
  
  private
  def load_variables
    @organization = Organization.find(params[:organization_id])
    @organizations = Organization.all(:order => :name)
    @services = Service.all(:order => :name)
    @business_types = BusinessType.all(:order => :name)
  end
end

class Admin::BusinessTypesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @business_types = BusinessType.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @business_type = BusinessType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @business_type = BusinessType.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @business_type = BusinessType.find(params[:id])
  end

  def create
    @business_type = BusinessType.new(params[:business_type])

    respond_to do |format|
      if @business_type.save
        format.html { redirect_to admin_business_types_url, notice: 'Business Type was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @business_type = BusinessType.find(params[:id])

    respond_to do |format|
      if @business_type.update_attributes(params[:business_type])
        format.html { redirect_to admin_business_types_url, notice: 'Business Type was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @business_type = BusinessType.find(params[:id])
    @business_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_business_types_url }
    end
  end
end

class PropertiesController < ApplicationController

  def index
    @properties = Property.all
    @property = Property.new
    @search_term = params[:query]
    @city_results = Property.basic_search(:city => params[:query])
    @state_results = Property.basic_search(:state => params[:query])

  end

  def show
    @property = Property.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if params[:property]
      @property.update(properties_params)
    end
      redirect_to property_path
  end

  def create
    @property = Property.new(properties_params)
    if @property.save
      flash[:notice] = "property created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to(root_path)
  end

private

  def properties_params
    params.require(:property).permit(:title, :description, :city, :state, :price, :user_id)
  end
end

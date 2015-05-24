class ManufacturersController < InheritedResources::Base

  def index    
      @manufacturers = Manufacturer.order(params[:iluha])
  end 

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  private

    def manufacturer_params
      params.require(:manufacturer).permit(:title, :description, :country, :city)
    end
end


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

  def update
    if resource.update(manufacturer_params)
    redirect_to @manufacturer, notice: 'Информация обновлена'
    else
      render :edit
    end
  end

  def destroy
    if resource.destroy
      flash[:notice] = 'Удалено'
    else
      flash[:error] = 'Не удалено, потому что есть товары с таким производителем'
    end
    redirect_to manufacturers_path
  end

  private

    def manufacturer_params
      params.require(:manufacturer).permit(:title, :description, :country, :city)
    end
end


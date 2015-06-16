class TipingsController < InheritedResources::Base

def index    
      @tipings = Tiping.all
  end 

  def show
    @tiping = Tiping.find(params[:id])
  end

  def new
    @tiping = Tiping.new
  end

  def destroy
    if resource.destroy
      flash[:notice] = 'Удалено'
    else
      flash[:error] = 'Не удалено, потому что есть товары с таким типом'
    end
    redirect_to tipings_path
  end

  private

    def tiping_params
      params.require(:tiping).permit(:title, :description)
    end
end


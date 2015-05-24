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

  private

    def tiping_params
      params.require(:tiping).permit(:title, :description)
    end
end


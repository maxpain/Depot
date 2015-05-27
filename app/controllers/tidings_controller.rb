class TidingsController < InheritedResources::Base
  before_action :set_tiding, only: [:show, :edit, :update, :destroy]

  def index    
    @tidings = Tiding.all
  end

  def show
  end

  def new
    @tiding = Tiding.new
  end

  def edit
  end

  def create
    @tiding = Tiding.new(tiding_params)

    respond_to do |format|
      if @tiding.save
        format.html { redirect_to @tiding, notice: 'Новость добавлена' }

      else
        format.html { render :new }

      end
    end
  end

  private

    def tiding_params
      params.require(:tiding).permit(:title, :description, :image_url)
    end

    def set_tiding
      @tiding = Tiding.find(params[:id])
    end
end


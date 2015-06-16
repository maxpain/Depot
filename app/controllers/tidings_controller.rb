class TidingsController < InheritedResources::Base
  before_action :set_tiding, only: [:show, :edit, :update, :destroy]

  def update
    if @tiding.update(tiding_params)
      redirect_to @tiding, notice: 'Новость успешно обновлена'
    else
      render :edit
    end
  end

  def new
    @tiding = Tiding.new
  end


  def create
    @tiding = Tiding.new(tiding_params)
      if @tiding.save
        redirect_to @tiding, notice: 'Новость добавлена'
      else
       render :new
      end
  end

  def destroy
    if resource.destroy
      flash[:notice] = 'Удалено'
    else
      flash[:error] = 'Не удалось удалить'
    end
    redirect_to welcome_index_path
  end


  private

    def tiding_params
      params.require(:tiding).permit(:title, :description, :image_url)
    end

    def set_tiding
      @tiding = Tiding.find(params[:id])
    end
end


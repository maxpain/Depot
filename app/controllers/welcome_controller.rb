class WelcomeController < ApplicationController

  def new
    @tiding = Tiding.new
  end

  def index
    @tidings = Tiding.all.order(created_at: :desc).page(params[:page]).per(3)
  end

  def update
    if @tiding.update(tiding_params)
      redirect_to @tiding, notice: 'Новость успешно обновлена'
    else
      render :edit
    end
  end



end

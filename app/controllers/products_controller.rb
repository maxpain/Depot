class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index    
 #     @products = Product.order(params[:iluha]).page(params[:page]).per(3)
 #     @search = Log.ransack(params[:log_search], search_key: :log_search)
    @search = Product.search(params[:q])
    @products = @search.result(distinct: true).order(params[:iluha]).page(params[:page]).per(3)
  end 

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Продукт успешно добавлен'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Продукт успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Продукт успешно удален'
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :manufacturer_id, :tiping_id)
    end
end

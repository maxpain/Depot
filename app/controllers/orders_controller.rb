class OrdersController < ApplicationController

  def index
    if current_user.try(:admin?)  
      @orders = Order.where("status >= 1")
    else
      @orders = Order.where(send_user_id: current_user.try(:id))    
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def user_complete
    @order = Order.find(params[:id])
    if @order.complete!    
      flash[:notice] = 'Подтверждено'
    else
      flash[:alert] = 'Не удалось подтвердить'
    end
    redirect_to orders_path
  end

  def admin_perform
    @order = Order.find(params[:id])
    if @order.perform!    
      flash[:notice] = 'Заказ выполняется'
    else
      flash[:alert] = 'Не удалось подтвердить начало выполнения'
    end
    redirect_to orders_path
  end

  def admin_made
    @order = Order.find(params[:id])
    if @order.made!    
      flash[:notice] = 'Заказ выполнен'
    else
      flash[:alert] = 'Не удалось завершить выполнение'
    end
    redirect_to orders_path
  end

  def destroy_all_line_items
    @order = Order.find(params[:id])
    @order.line_items.map(&:delete)
    redirect_to products_url, notice: 'Корзина очищена'
  end  

  def send_to_user
    @order = current_order
    if @order.send!(send_to_user_params)
      cookies[:current_order] = nil
      flash[:notice] = 'Товары отправлены'
      check_current_order
    else
      flash[:alert] = 'Не удалось отправить товары'
    end
    redirect_to products_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Заказ удален'    
  end

  private

    def send_to_user_params
      params.require(:order).permit(:send_user_id, :email, :fio, :phone_number, :total_price, :message)
    end

end

class OrdersController < ApplicationController

  def index     #запрос на вывод всех заказов
    if current_user.try(:admin?)  
      @orders = Order.where("status >= 1")
    else
      @orders = Order.where(send_user_id: current_user.try(:id))    
    end
  end

  def show      #показать заказ
    @order = Order.find(params[:id])
  end

  def user_complete     #статус заказа - подтверждено
    @order = Order.find(params[:id])
    if @order.complete!    
      flash[:notice] = 'Подтверждено'
    else
      flash[:alert] = 'Не удалось подтвердить'
    end
    redirect_to orders_path
  end

  def admin_perform     #статус заказа - выполняется
    @order = Order.find(params[:id])
    if @order.perform!    
      flash[:notice] = 'Заказ выполняется'
    else
      flash[:alert] = 'Не удалось подтвердить начало выполнения'
    end
    redirect_to orders_path
  end

  def admin_made      #статус заказа - выполнен
    @order = Order.find(params[:id])
    if @order.made!    
      flash[:notice] = 'Заказ выполнен'
    else
      flash[:alert] = 'Не удалось завершить выполнение'
    end
    redirect_to orders_path
  end

  def destroy_all_line_items    #очистить корзину
    @order = Order.find(params[:id])
    @order.line_items.map(&:delete)
    redirect_to products_url, notice: 'Корзина очищена'
  end  

  def send_to_user        #передать данные текущего заказа клиенту
    @order = current_order
    if @order.send!(send_to_user_params)
      flash[:notice] = 'Товары отправлены'
    else
      flash[:alert] = 'Не удалось отправить товары'
    end
    session[:current_order] = nil
    redirect_to products_path
  end

  def destroy   #удалить заказ
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Заказ удален'    
  end

  private

    def send_to_user_params   #какие поля передавать клиенту
      params.require(:order).permit(:send_user_id, :email, :fio, :phone_number, :total_price, :message)
    end

end

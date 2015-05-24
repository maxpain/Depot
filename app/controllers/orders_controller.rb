class OrdersController < ApplicationController

  def index
    if current_user.try(:admin?)      
      @orders = Order.all
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
  

  def send_to_user
    @order = current_order
    if @order.send!(send_to_user_params)
      session[:current_order] = nil
      flash[:notice] = 'Товары отправлены'
    else
      flash[:alert] = 'Не удалось отправить товары'
    end
    redirect_to products_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    #current_order.line_items.delete_all
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order destroyed' }
      format.json { head :no_content }
    end
  end

  private

    def send_to_user_params
      params.require(:order).permit(:send_user_id, :email, :fio, :phone_number, :total_price, :message)
    end

end

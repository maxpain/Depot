class LineItemsController < ApplicationController
  def create      #создание нового лайнитема
    @line_item = LineItem.new(permitted_params.merge(order_id: current_order.id))   
    if @line_item.save    
      flash[:notice] = 'Добавлено'
    end
    redirect_to products_path

  end

  def update      #создание нового лайнитема
    @line_item = LineItem.find(params[:id])
    @line_item.update(permitted_params)
    redirect_to products_path
  end

  def destroy     #удаление лайнитема
    @line_item = LineItem.find(params[:id])
    @order = @line_item.order
    @line_item.destroy

  #  if @order.line_items.blank?  #если лайнитемы закончились, то удалить заказ
  #    @order.destroy
  #    redirect_path = orders_path
  #  end

    respond_to do |format|
      format.html do
        redirect_to request.referer || products_path, notice: 'Item destroyed'
      end
    end
  end

  private

    def permitted_params
      params.require(:line_item).permit(:count, :product_id)
    end
end

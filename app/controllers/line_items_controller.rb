class LineItemsController < ApplicationController
  def create
    @line_item = LineItem.new(permitted_params.merge(order_id: current_order.id))
    if @line_item.save
      flash[:notice] = 'Добавлено'
    end
    redirect_to products_path
  end



  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(permitted_params)
    redirect_to products_path
  end

  def destroy_all

    current_order.line_items.delete_all
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Cart destroyed' }
      format.json { head :no_content }
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @order = @line_item.order
    @line_item.destroy

    if @order.line_items.blank?
      @order.destroy
      redirect_path = orders_path
    end

    #current_order.line_items.delete_all
    respond_to do |format|
      format.html do
        redirect_to redirect_path || request.referer || products_path, notice: 'Item destroyed'
      end
      format.json { head :no_content }
    end
  end

  private

    def permitted_params
      params.require(:line_item).permit(:count, :product_id)
    end
end

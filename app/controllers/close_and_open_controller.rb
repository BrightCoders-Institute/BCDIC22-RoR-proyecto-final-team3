class CloseAndOpenController < ApplicationController

  helper_method :update_status

  def index
    @tables = Table.all
    @orders = Order.all
    @orderitems = OrdersItem.all

    if params[:tables_id]
      @orders = @orders.where(tables_id: params[:tables_id])
    end

    if params[:order_id].present?
      @order = params[:order_id]
    else
      @order = 'SELECT'
    end

    if params[:order_status].present?
      @status = params[:order_status]
    else
      @status = 'SELECT'
    end

    if params[:order_tables_id].present?
      @tables = params[:order_tables_id]
    else
      @tables = 'SELECT'
    end

    if params[:order_total].present?
      @total = params[:order_total]
    else
      @total = 'SELECT'
    end

    if params[:orderitems_quantity].present?
      @quantity = params[:orderitems_quantity]
    else
      @quantity = 'SELECT'
    end

  end

  def update_status
    if order.status == 'wait'
      order.update(status: 'paid')
    elsif order.status == 'progress'
      order.update(status: 'paid')
    elsif order.status == 'done'
      order.update(status: 'paid')
    end
    redirect_to close_and_open_index_path
  end

  def order
    Order.find(params[:id])
  end

end

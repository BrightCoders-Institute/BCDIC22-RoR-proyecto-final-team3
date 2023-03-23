class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all

    @tables = Table.all
    @mesa_seleccionada = session[:mesa_seleccionada]
    @orders = Order.all

    @category = params[:category]

    @input = params[:name]
    @products = if @input
                  Item.where('name ILIKE ?', "%#{@input}%")
                elsif @category.present?
                  if @category === 'all'
                    Item.all
                  else
                    Item.where('category ILIKE ?', "%#{@category}%")
                  end

                else
                  Item.all
                end
    @order = Order.count
    @mesa = params[:selected_table_id]
  end

  def create
    items = params[:order]
    total = params[:total]
    note = params[:note]
    mesa = params[:selected_table_id]

    newOrder = Order.create(
      tables_id: mesa,
      status: 'wait',
      total: total,
      note: note
    )

    items.each do |item|
      id = Item.find_by(name: item[:name]).id
      OrdersItem.create(orders_id: newOrder.id, items_id: id, quantity: item[:quantity])
    end
  end
end

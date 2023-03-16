class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    @tables = Table.all
    @orders = Order.select("DISTINCT ON (tables_id) *").order("tables_id, created_at DESC")
    @category = params[:category]

    @input = params[:name]
    @order = (Order.count + 1) unless (@order = params[:order])

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
  end

  def create
    items = params[:order]
    total = params[:total]
    note = params[:note]
    mesa = params[:selected_table_id]
    number_order = params[:numberOrder]

    if number_order
      newOrder = Order.find(number_order)
      newOrder.total += total
      newOrder.status = 'wait'
      newOrder.note += "\n #{note}"
      newOrder.save
    else
      newOrder = Order.create(
        tables_id: mesa,
        status: 'wait',
        total: total,
        note: note
      )
      number_order = newOrder.id
    end

    items.each do |item|
      id = Item.find_by(name: item[:name]).id
      OrdersItem.create(order_id: number_order, item_id: id, quantity: item[:quantity])
      ingredients = Recipe.all.where(id_item: id)
      ingredients.each do |ingredientRecipe|
        ingredient = Ingredient.find(ingredientRecipe.id_ingredient)
        ingredient.total -=  ingredientRecipe.quantity * item[:quantity]
        ingredient.total = 0 if ingredient.total < 0
        ingredient.save
      end
    end
  end
end

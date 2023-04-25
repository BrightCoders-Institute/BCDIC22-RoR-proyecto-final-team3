require 'faker'
require "open-uri"

totalDays= 2 * 30

numberTables = 10

numberitemsfood = 10

numberitemsdessert = 8

numberitemsdrink = 15

totalnumberitems = 14

numberOrders = numberTables

numberIngredients = 61

# Tables
(numberTables).times do |i|
  Table.create(
    name: Faker::Ancient.unique.god,
    size: Faker::Number.between(from: 2, to: 10))
end

def randstatus
  ns = rand(1..2)
  status = ' '
  if ns == 1
    status = 'wait'
  elsif ns == 2
    status = 'progress'
  end
  status
end


numberOrders.times do |i|
  if rand(0..1) == 1
    Order.create(
      tables_id: i+1,
      status: randstatus,
      total: Faker::Number.between(from: 300, to: 1000),
      note: Faker::Food.description,
    )
  end
end


#Ordersitems
numberOrders.times do |i|
  howmanyitems = Faker::Number.between(from: 5, to: 10)
  howmanyitems.times do |j|
    itemID = Faker::Number.unique.between(from: 1, to: totalnumberitems)
    OrdersItem.create(order_id: i+1  , item_id: itemID, quantity: Faker::Number.between(from: 1, to: 3))
  end
  Faker::Number.unique.clear
end

#User
User.create({:email => "admin@gmail.com", :password => "123456", :password_confirmation => "123456" })

# 8 platillos (categoría 'Food')
item = Item.create(name: 'Alitas de pollo', price: 119, category: 'Food', description: 'Alitas de pollo fritas y sazonadas con especias, acompañadas de salsa picante')
item.image.attach(io: File.open('app/assets/images/seed/alitas.png'), filename: 'alitas.png')

item = Item.create(name: 'Nachos', price: 149, category: 'Food', description: 'Tortilla chips con queso fundido, jalapeños, pico de gallo, frijoles y guacamole')
item.image.attach(io: File.open('app/assets/images/seed/nachos.png'), filename: 'nachos.png')

item = Item.create(name: 'Hamburguesa con queso', price: 159, category: 'Food', description: 'Hamburguesa de carne de res a la parrilla, queso fundido, lechuga, tomate y mayonesa')
item.image.attach(io: File.open('app/assets/images/seed/hamburguesa.png'), filename: 'hamburguesa.png')

item = Item.create(name: 'Sándwich de pollo', price: 139, category: 'Food', description: 'Pan de molde, pechuga de pollo empanizada, lechuga, tomate y mayonesa')
item.image.attach(io: File.open('app/assets/images/seed/sandwich.png'), filename: 'sandwich.png')

item = Item.create(name: 'Tacos de pescado', price: 179, category: 'Food', description: 'Tortillas de maíz rellenas de filete de pescado empanizado, col morada, cilantro y salsa picante')
item.image.attach(io: File.open('app/assets/images/seed/tacos.png'), filename: 'tacos.png')

item = Item.create(name: 'Pizza Margherita', price: 169, category: 'Food', description: 'Pizza con salsa de tomate, queso mozzarella y hojas de albahaca fresca')
item.image.attach(io: File.open('app/assets/images/seed/pizza.png'), filename: 'pizza.png')

item = Item.create(name: 'Ensalada César', price: 129, category: 'Food', description: 'Lechuga romana, pollo a la parrilla, crotones de pan, queso parmesano y aderezo César')
item.image.attach(io: File.open('app/assets/images/seed/ensalada.png'), filename: 'ensalada.png')

item = Item.create(name: 'Fish and Chips', price: 179, category: 'Food', description: 'Filete de pescado empanizado con papas fritas y salsa tártara')
item.image.attach(io: File.open('app/assets/images/seed/fish_chips.png'), filename: 'fish_chips.png')

# Drinks
item = Item.create(name: 'Coca-Cola', price: 39, category: 'Drink', description: 'Refresco de cola')
item.image.attach(io: File.open('app/assets/images/seed/coca_cola.png'), filename: 'coca_cola.png')

item = Item.create(name: 'Sprite', price: 39, category: 'Drink', description: 'Refresco de lima-limón')
item.image.attach(io: File.open('app/assets/images/seed/sprite.png'), filename: 'sprite.png')

item = Item.create(name: 'Agua', price: 29, category: 'Drink', description: 'Agua natural')
item.image.attach(io: File.open('app/assets/images/seed/agua.png'), filename: 'agua.png')

# Dessert
item = Item.create(name: 'Sundae', price: 39, category: 'Dessert', description: 'Helado de vainilla con salsa de caramelo')
item.image.attach(io: File.open('app/assets/images/seed/sundae.png'), filename: 'sundae.png')

item = Item.create(name: 'Pie de manzana', price: 49, category: 'Dessert', description: 'Pie de manzana caliente')
item.image.attach(io: File.open('app/assets/images/seed/pie.png'), filename: 'pie.png')

item = Item.create(name: 'McFlurry Oreo', price: 59, category: 'Dessert', description: 'Helado de vainilla con trozos de galleta Oreo')
item.image.attach(io: File.open('app/assets/images/seed/mcflurry.png'), filename: 'mcflurry.png')


# Ingredientes para las comidas
Ingredient.create(name: 'Carne de res', quant: 'grams', price: 0.12, total: rand(900..1800))
Ingredient.create(name: 'Queso americano', quant: 'grams', price: 0.08, total: rand(700..1800))
Ingredient.create(name: 'Aros de cebolla crujientes', quant: 'grams', price: 0.05, total: rand(700..1800))
Ingredient.create(name: 'Salsa BBQ', quant: 'ml', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Pechuga de pollo', quant: 'grams', price: 0.10, total: rand(700..1800))
Ingredient.create(name: 'Tocino', quant: 'grams', price: 0.06, total: rand(700..1800))
Ingredient.create(name: 'Lechuga', quant: 'grams', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Tomate', quant: 'grams', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Pan de hamburguesa', quant: 'unidad', price: 0.20, total: rand(700..1800))
Ingredient.create(name: 'Salsa de tomate', quant: 'ml', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Pasta', quant: 'grams', price: 0.05, total: rand(700..1800))
Ingredient.create(name: 'Salsa de queso', quant: 'ml', price: 0.03, total: rand(700..1800))
Ingredient.create(name: 'Albahaca', quant: 'grams', price: 0.02, total: rand(700..1800))

# Ingredientes para las bebidas
Ingredient.create(name: 'Cerveza', quant: 'unidad', price: 1.50, total: rand(700..1800))
Ingredient.create(name: 'Tequila', quant: 'ml', price: 0.05, total: rand(700..1800))
Ingredient.create(name: 'Ron', quant: 'ml', price: 0.04, total: rand(700..1800))
Ingredient.create(name: 'Vodka', quant: 'ml', price: 0.04, total: rand(700..1800))
Ingredient.create(name: 'Triple sec', quant: 'ml', price: 0.03, total: rand(700..1800))
Ingredient.create(name: 'Jugo de limón', quant: 'ml', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Jugo de arándanos', quant: 'ml', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Tónica', quant: 'ml', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Agua', quant: 'ml', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Té negro', quant: 'grams', price: 0.03, total: rand(700..1800))
Ingredient.create(name: 'Jarabe natural', quant: 'ml', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Jugo de naranja', quant: 'ml', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Jugo de naranja', quant: 'ml', price: 0.02, total: rand(700..1800))
Ingredient.create(name: 'Refresco de cola', quant: 'ml', price: 0.01, total: rand(700..1800))
Ingredient.create(name: 'Hielo', quant: 'grams', price: 0.01, total: rand(700..1800))

# Ingredientes para los postres
Ingredient.create(name: 'Helado de vainilla', quant: 'grams', price: 0.07, total: rand(700..1800))
Ingredient.create(name: 'Brownie', quant: 'unidad', price: 0.80, total: rand(700..1800))
Ingredient.create(name: 'Fresas', quant: 'grams', price: 0.03, total: rand(700..1800))
Ingredient.create(name: 'Chocolate derretido', quant: 'ml', price: 0.04, total: rand(700..1800))
Ingredient.create(name: 'Crema batida', quant: 'ml', price: 0.02, total: rand(700..1800))


# Recetas para Alitas de pollo
Recipe.create(id_item: 1, id_ingredient: 1, quantity: rand(100..300))
Recipe.create(id_item: 1, id_ingredient: 4, quantity: rand(20..50))
Recipe.create(id_item: 1, id_ingredient: 5, quantity: rand(20..50))
Recipe.create(id_item: 1, id_ingredient: 6, quantity: rand(10..30))

# Recetas para Nachos
Recipe.create(id_item: 2, id_ingredient: 2, quantity: rand(100..300))
Recipe.create(id_item: 2, id_ingredient: 3, quantity: rand(20..50))
Recipe.create(id_item: 2, id_ingredient: 4, quantity: rand(20..50))
Recipe.create(id_item: 2, id_ingredient: 5, quantity: rand(20..50))
Recipe.create(id_item: 2, id_ingredient: 7, quantity: rand(20..50))

# Recetas para Hamburguesa con queso
Recipe.create(id_item: 3, id_ingredient: 1, quantity: rand(100..300))
Recipe.create(id_item: 3, id_ingredient: 2, quantity: rand(50..100))
Recipe.create(id_item: 3, id_ingredient: 5, quantity: rand(20..50))
Recipe.create(id_item: 3, id_ingredient: 6, quantity: rand(10..30))

# Recetas para Sándwich de pollo
Recipe.create(id_item: 4, id_ingredient: 1, quantity: rand(100..300))
Recipe.create(id_item: 4, id_ingredient: 8, quantity: rand(50..100))
Recipe.create(id_item: 4, id_ingredient: 5, quantity: rand(20..50))
Recipe.create(id_item: 4, id_ingredient: 6, quantity: rand(10..30))

# Recetas para Tacos de pescado
Recipe.create(id_item: 5, id_ingredient: 9, quantity: rand(100..300))
Recipe.create(id_item: 5, id_ingredient: 10, quantity: rand(50..100))
Recipe.create(id_item: 5, id_ingredient: 11, quantity: rand(20..50))
Recipe.create(id_item: 5, id_ingredient: 5, quantity: rand(20..50))
Recipe.create(id_item: 5, id_ingredient: 12, quantity: rand(10..30))

# Recetas para Pizza Margherita
Recipe.create(id_item: 6, id_ingredient: 13, quantity: rand(100..300))
Recipe.create(id_item: 6, id_ingredient: 14, quantity: rand(50..100))
Recipe.create(id_item: 6, id_ingredient: 15, quantity: rand(10..30))

# Recetas para Ensalada César
Recipe.create(id_item: 7, id_ingredient: 16, quantity: rand(100..300))
Recipe.create(id_item: 7, id_ingredient: 8, quantity: rand(50..100))
Recipe.create(id_item: 7, id_ingredient: 17, quantity: rand(20..50))
Recipe.create(id_item: 7, id_ingredient: 18, quantity: rand(20..50))

for i in 8..14 do
  rand(1..3).times do |_|
    Recipe.create(id_item: i, id_ingredient: rand(1..33), quantity: rand(20..100))
  end
end

totalDays.times do |i|
  rand(1..8).times do |_|
    order = Order.create(
      tables_id: rand(1..numberTables),
      status: 'paid',
      total: Faker::Number.between(from: 300, to: 1000),
      note: Faker::Food.description,
      created_at: (i + 1).days.ago
    )
    rand(1..4).times do |_|
      OrdersItem.create(order_id: order.id, item_id: rand(1..totalnumberitems),
                        quantity: Faker::Number.between(from: 1, to: 3))
    end
  end
end

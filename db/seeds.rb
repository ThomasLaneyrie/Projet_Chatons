# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Category.destroy_all
Item.destroy_all

nb_cart = 10
nb_item = 10
nb_category = 1
nb_line_cart = 10
nb_order = 10
nb_user = 10

carts = []
items = []
categories = []
line_carts = []
orders = []
users = []

#seeding des users "creation des users"

nb_user.times do |x|
	user = User.create(
		email: Faker::Internet.email,
		password: "password",
		first_name: Faker::Books::Dune.planet,
		last_name: Faker::Books::Dune.city,
		address: Faker::Address.street_address,
		city: Faker::Address.city,
		zip_code: Faker::Address.zip_code,
		is_admin?: false,
		)
		users << user
 	puts "Seeding user nb#{x}"
end

#seeding d'une catégorie "pics - mugs - stickers - magnets"

	nb_category.times do |x|
		category = Category.create(
		type_category: 'pics',
		)
		categories << category
	puts "Seeding category nb#{x}"
	end

#seeding des items "produits"

	nb_item.times do |x|
		item = Item.create(
			title: Faker::ElectricalComponents.active,
			description: Faker::Lorem.words(number: 4, exclude_words: 'error'),
			price: rand(1..20),
			image_url: 'https://www.art-deco-stickers.fr/968-tm_large_default/sticker-mural-chaton.jpg',
			category: Category.first
			)
		items << item
		puts "Seeding item nb#{x}"
	end

#seeding des carts "paniers"

	nb_cart.times do |x|
		cart = Cart.create(
			user_id: users[rand(0..nb_user-1)].id,
			)
		carts << cart
		puts "Seeding cart nb#{x}"
	end

#seeding des orders "commandes aprés panier"

	nb_order.times do |x|
		order = Order.create(
			stripe_id: "1",
			user_id: rand(1..10),
			cart_id: rand(1..10),
		)
		orders << order
		puts "Seeding order nb#{x}"
	end
	
#seeding des line_carts "table de jointure"

	nb_line_cart.times do |x|
		line_cart = Line_cart.create(
			quantity: rand(1..10),
			cart_id: cart[rand(0..nb_cart-1)].id,
			item_id: rand(1..10),
		)
		line_carts << line_cart
		puts "Seeding line_cart nb#{x}"
	end




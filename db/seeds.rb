# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil


OrderDetail.destroy_all
Order.destroy_all
Product.destroy_all
Tag.destroy_all
Review.destroy_all
Transaction.destroy_all
Categorization.destroy_all
Category.destroy_all
User.destroy_all


def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
    rand * (to - from) + from
end

def rand_int(from, to)
    rand_in_range(from, to).to_i
end


10.times do |i|
    name = Faker::Commerce.department
    description= Faker::Commerce.promotion_code

    category = Category.create(
        name: name,
        description: description
    )

    10.times do |i|
        name = Faker::Commerce.product_name
        description = Faker::Food.description
        sku = Faker::Alphanumeric.alphanumeric(number: 10)
        list_price = Faker::Commerce.price(range: 10..100.0)
        product_type =  i % 2 == 0 ? "digital" : "store"
        status = 1
        quantity = rand (1..10)
    
        product = Product.create(
            name: name,
            description: description,
            sku: sku,
            list_price: list_price,
            status: 1,
            quantity: quantity,
            product_type: product_type
        )
        
        product.categories << category
    end
end

10.times do 
    user = User.create(
        username: Faker::Internet.unique.email,
        password: "123456"
    )
end

puts "Seeding order data..."
User.all.each_with_index do |user,i|
    order_date = i % 2 == 0 ? rand_time(2.days.ago) : rand_time(5.days.ago)
    order = Order.create!(
        order_date: order_date,
        user_id:user.id,
        order_total: 0
    )

    orders = []
    5.times do |order_count|
        unit_price = rand_int(5,99)
        quantity = rand_int(1,5)
        product_offset = rand(Product.count)
        orders << OrderDetail.create!(
            order_id: order.id,
            product_id: Product.offset(product_offset).first.id,
            sku: Product.first.sku,
            unit_price: unit_price,
            quantity: quantity,
            sub_total: quantity * unit_price
        )
    end


    #puts order.items.group(:order_id).to_sql

    #order.order_total = order.items.group(:order_id).sum(:sub_total)

    # order.join(:items).group('order_id').pluck("sum(items.sub_total) as sub_total").to_sql
    
    sub_total = Order.joins(:items).where("order_details.order_id = ?", order.id).sum(:sub_total)
    order.order_total = sub_total
    order.save!
    puts "#{i} order created!"
end




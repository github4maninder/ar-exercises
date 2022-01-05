require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
 Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
 Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

 puts " --- Mens stores  ---"
 @mens_stores = Store.where(mens_apparel: true).order(name: :asc)
 @mens_stores.each do |store|
   puts "Store: #{store.name} , annual_revenue: #{store.annual_revenue}"
 end
 puts " --- Womens stores with revenue above 1M ---"
 @womens_stores_above1m = Store.where(["womens_apparel = :womens_apparel and annual_revenue < :annual_revenue", {womens_apparel: true, annual_revenue: 1000000}]).order(name: :asc)
 @womens_stores_above1m.each do |store|
   puts "Store: #{store.name} , annual_revenue: #{store.annual_revenue}"
 end 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating data arrays"
fabrics = ["Fabric 1", "fabric 2", "Fabric 3"]
linings = ["Lining 1", "Lining 2", "Lining 3"]
buttons = ["Button 1", "Button 2", "Button 3"]

puts "emptying the db"
Kit.destroy_all
Fabric.destroy_all
Lining.destroy_all
Button.destroy_all

puts "creating seeds"
fabrics.each do |fabric|
  Fabric.create!(name: fabric)
end

linings.each do |lining|
  Lining.create!(name: lining)
end

buttons.each do |button|
  Button.create!(name: button)
end

7.times do
  Kit.create!(
    name: (0...5).map { ('a'..'z').to_a[rand(26)] }.join,
    fabric_id: Fabric.order(Arel.sql('RANDOM()')).first.id,
    lining_id: Lining.order(Arel.sql('RANDOM()')).first.id,
    button_id: Button.order(Arel.sql('RANDOM()')).first.id
  )
end

puts "Done!"

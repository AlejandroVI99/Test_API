require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create({rating:'4', name:'prueba', site:'prueba',email:'prueba',phone:'prueba', street:'prueba',city:'prueba',
									state:'prueba', lat:'prueba', lng:'prueba'})

#Lines of code to read all csv files and import all the data to the database
csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurantes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
	r = Restaurant.new
	r.id = row[0].to_i,
	r.rating =row['rating'],
	r.name = row['name'],
	r.site = row['site'],
	r.email = row['email'],
	r.phone = row['phone'],
	r.street = row['street'],
	r.city = row['city'],
	r.state = row['state'],
	r.lat = row['lat'].to_f,
	r.lng = row['lng'].to_f
	r.save
  puts "#{r.id}, #{r.lng} saved"

end
					

puts "There are now #{Restaurant.count} rows in the transactions table"
puts "Beginnig of Seeding !"
nb_seed = 20

puts "Let's seed with #{nb_seed} users and #{nb_seed / 2} flats"

nb_seed.times do |x|
  puts "**** USER #{x} ****"
  user_first_name = Faker::Name.first_name
  user_last_name = Faker::Name.last_name
  user_email = user_first_name + '.' + user_last_name + '@' + Faker::Internet.domain_name
  pwd = "123456"

  reg = Registration.new(email: user_email, password: pwd)
  puts "Registration #{x} created" if reg.save

  user = User.new(first_name: user_first_name, last_name: user_last_name, registration_id: reg.id)
  puts "User #{x} created" if user.save

  if x % 2 == 0
    puts "    >>>> Let's create Flat #{x / 2}"
    flat_name = user_first_name + "'s flat"
    flat_address = Faker::Address.street_address + ', ' + Faker::Address.city
    pets_allowed = rand(2) == 1
    wifi_available = rand(2) == 1
    wifi_pwd = wifi_available ? Faker::Internet.password(8) : ""
    description = "What a nice flat " + user_first_name + " has !!!"
    price = rand(10) + 30
    flat = Flat.new(name: flat_name, address: flat_address, nb_rooms: rand(2) + 1, nb_people_max: rand(6), pets_allowed: pets_allowed, wifi_available: wifi_available, wifi_pwd: wifi_pwd, description: description, price: price.to_i)
    flat.user = user
    puts "    >>>> Flat #{x / 2} created" if flat.save
  end
  puts ""
end


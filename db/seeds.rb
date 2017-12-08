ADDRESSES = ["Eiffel Tower", "Paris", "One Altitude, Singapore", "Suresnes, France", "Porte de Versailles", "Timisoara", "Alcatraz, San Francisco", "San Francisco", "150 South bridge Road", "club street, singapore", "London", "Turf road, Singapore", "107 boulevard Charonne, Paris", "Sevres Babylone, Paris", "New York"]

puts "Beginnig of Seeding !"
nb_seed = 30

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
  if user.save
    user.photo_url = "https://i.pinimg.com/236x/c2/7c/27/c27c277903bc87b329a29005a1a371b2--funny-facebook-picture-collection.jpg"
    puts "User #{x} created"
  end

  if x % 2 == 0
    puts "    >>>> Let's create Flat #{x / 2}"
    flat_name = user_first_name + "'s flat"
    flat_address = ADDRESSES[(x / 2)]
    pets_allowed = rand(2) == 1
    wifi_available = rand(2) == 1
    wifi_pwd = wifi_available ? Faker::Internet.password(8) : ""
    description = "What a nice flat " + user_first_name + " has !!!"
    price = rand(10) + 30
    flat = Flat.new(name: flat_name, address: flat_address, nb_rooms: rand(2) + 1, nb_people_max: rand(6), pets_allowed: pets_allowed, wifi_available: wifi_available, wifi_pwd: wifi_pwd, description: description, price: price.to_i)
    flat.user = user
    if flat.save
      pic_urls = ["https://picsum.photos/1200/1200/?random", "https://picsum.photos/1200/1200/?random"]
      flat.photo_urls = pic_urls
      puts "    >>>> Flat #{x / 2} created"
    end
  end
  puts ""
end


Booking.create(nb_night: 5)

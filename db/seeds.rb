# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 0,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})
## USERS
User.destroy_all
user1 = User.create({
  name: 'Bradley Cooper',
  email: 'brad_coop@gmail.com',
  password_digest: "fdbhfdi[hbshbfdsihbwcdHBIEW"
})
user2 = User.create({
  name: 'Jesus Christ',
  email: 'theholy1@gmail.com',
  password_digest: "fdsvodsds;bjdsafljd"
})
user3 = User.create({
  name: 'Bun B',
  email: 'bunB@gmail.com',
  password_digest: "fefhgsuigfdipsbapib"
})
## REVIEWS 
Review.destroy_all
prod1 = Product.find_by name: 'Red Bookshelf' 
prod2 = Product.find_by name: 'Electric Chair'
prod3 = Product.find_by name: 'Modern Skateboards'
prod1.reviews.create! ({
  user_id: 1,
  description: "With stunning speed and reliability, 
  the Samsung 64GB MicroSDXC EVO Select memory card 
  lets you get the most out of your devices. Ultra-fast 
  read & write speeds of up to 100MB/s & 60MB/s and backed by 
  4-proof protection, keep your data safe against water, extreme temperatures, 
  and other harsh conditions. Feel confident to capture, store and transfer 
  4K UHD videos, photos, music and other large files effortlessly. 
  Your memories and adventures are irreplaceable, and now unforgettable.",
  rating: 5
})
prod1.reviews.create! ({
  user_id: 3,
  description: "def dont buy",
  rating: 2
})
prod1.reviews.create! ({
  user_id: 2,
  description: "u gotta have this thing!!",
  rating: 4
})
prod2.reviews.create! ({
  user_id: 1,
  description: "WOW A MUST BUY!!!!",
  rating: 5
})
prod2.reviews.create! ({
  user_id: 3,
  description: "totally awesome would def by for one of my dogs",
  rating: 5
})
prod2.reviews.create! ({
  user_id: 2,
  description: "are you crazy?? this grabage",
  rating: 1
})

prod3.reviews.create! ({
  user_id: 1,
  description: "FREAKING AWESOME - I 
  cut the cord and I was VERY VERY hesitant to 
  do so. I was worried about not having some of 
  the channels I watched a lot of - ESPN, HGTV and 
  some others but I will get to that in a minute. I was 
  also worried about not being able to PAUSE live TV. Well 
  the TIVO Roamio = AWESOMENESS. I have an HDTV over the air 
  antenna I get ABC, CBS, NBC and FOX and PBS KIDS in perfect 
  clarity and they have plenty of sports and shows. It is so easy 
  to set up a recording and get the TiVo to keep recording the shows 
  I like. I can pause the adult shows when my kid walks into the room and 
  I can pause her shows when I need to get her attention 
  (TV is crack to a child).",
  rating: 5
})
prod3.reviews.create! ({
  user_id: 3,
  description: "def hot",
  rating: 2
})
prod3.reviews.create! ({
  user_id: 2,
  description: "not hot",
  rating: 3
})


puts "DONE!"

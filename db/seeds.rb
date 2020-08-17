# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all
Item.destroy_all

#merchants
bike_shop = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)
surf_shop = Merchant.create(name: "Corey's Surf Shop", address: '77 Beach Way', city: 'San Diego', state: 'CA', zip: 90210)

#users
@admin = User.create!(name: "Bob Vance",
                   address: "123 ABC St.",
                      city: "Denver",
                     state: "CO",
                       zip: "80202",
                     email: "admin@hotmail.com",
                  password: "adm",
                      role: 2)

@m_user = bike_shop.users.create(name: 'Megan',
                              address: '123 Main St',
                                 city: 'Denver',
                                state: 'CO',
                                  zip: 80218,
                                email: 'megan@example.com',
                             password: '123')

@user = User.create!(name: "Bob Vance",
                  address: "123 ABC St.",
                     city: "Denver",
                    state: "CO",
                      zip: "80202",
                    email: "example@hotmail.com",
                 password: "use",
                     role: 0)


#discounts
@discount1 = bike_shop.discounts.create!(name: "Tire Discount 10%", percent_off: 10, min_quantity: 5)
@discount2 = bike_shop.discounts.create!(name: "Tire Discount 20%", percent_off: 20, min_quantity: 7)


#bike_shop items
tire = bike_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)

bike_horn = bike_shop.items.create(name: "Honk Honk", description: "Everyone will hear you comming", price: 20, image: "https://pbs.twimg.com/media/DkbR-8yVsAABrCg.png", inventory: 4)

bike_lock = bike_shop.items.create(name: "Krytonite Lock", description: "Keep your lock safe while you're away.", price: 60, image: "https://i5.walmartimages.com/asr/875f4ecf-877b-41ad-8754-eb67e54e0fdd_1.c38843c2225b1b0ed22a6d5fe3fed788.jpeg", inventory: 4)

shift_cable = bike_shop.items.create(name: "Shift Cable, Road", description: "Shift cable for STI levers", price: 6, inventory: 100)

#dog_shop items
pull_toy = dog_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)

dog_bone = dog_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", inventory: 21)

dog_treat = dog_shop.items.create(name: "Alaska's Organic Dog Treats", description: "Give your pup something really tasty and healthy!", price: 10, image: "https://alaskasbakery.com/wp-content/uploads/2016/08/all31.png", inventory: 21)

#surf_shop items

surfboard = surf_shop.items.create(name: "Surfboard", description: "Hang ten all day with this awesome board!", price: 600, image: "https://cdn.shopify.com/s/files/1/0411/9757/products/Degree-33-Ultimate-Blue-Dip-Epoxy-Longboard-Deck_a8e36d7a-7804-4c24-aec2-a3f9ab0a6bf8_600x.jpg?v=1581623035", inventory: 21)

surf_suit = surf_shop.items.create(name: "UV Surf Suit", description: "Protect yourself from the rays and look good while surfing.", price: 40, image: "https://cdn.shopify.com/s/files/1/0029/3067/1665/products/liva-uv-surf-suit-14032653615187_2000x.jpg?v=1581401521", inventory: 21)

board_wax = surf_shop.items.create(name: "Mr Zogs Sex Wax", description: "Help your feet grip the board with this classic board wax.", price: 40, image: "https://nextadventure.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/e/sex_wax_tropical_water_surf.jpg", inventory: 21)

#orders
# order_1 = @user.orders.create!(name: 'Meg', address: '123 Stang St', city: 'Hershey', state: 'PA', zip: 80218)
# order_2 = @user.orders.create!(name: 'Cory', address: '567 Up St', city: 'Mars', state: 'CO', zip: 80218)
#
# item_order = order_1.item_orders.create!(item: tire, price: tire.price, quantity: 2, status: 0)
# item_order2 = order_1.item_orders.create!(item: bike_horn, price: bike_horn.price, quantity: 1, status: 1)
# item_order3 = order_2.item_orders.create!(item: bike_lock, price: bike_lock.price, quantity: 2, status: 0)
# item_order4 = order_2.item_orders.create!(item: pull_toy, price: pull_toy.price, quantity: 1, status: 0)
# item_order5 = order_2.item_orders.create!(item: dog_bone, price: dog_bone.price, quantity: 1, status: 0)
# item_order6 = order_2.item_orders.create!(item: dog_treat, price: dog_treat.price, quantity: 1, status: 0)

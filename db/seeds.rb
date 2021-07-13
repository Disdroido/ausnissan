# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Role.create({ name: 'Regular', description: 'Can read items' })
r2 = Role.create({ name: 'Seller', description: 'Can read and create items. Can update and destroy own items' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'Admin', email: 'admin@ausnissan.com', password: '123456', password_confirmation: '123456', role_id: r3.id })

i1 = Store.create({ name: 'Rayban Sunglasses', description: 'Stylish shades', price: 99.99, user_id: u1.id })
i2 = Store.create({ name: 'Gucci watch', description: 'Expensive timepiece', price: 199.99, user_id: u1.id })
i3 = Store.create({ name: 'Henri Lloyd Pullover', description: 'Classy knitwear', price: 299.99, user_id: u1.id })
i4 = Store.create({ name: 'Porsche socks', description: 'Cosy footwear', price: 399.99, user_id: u1.id })

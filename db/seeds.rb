# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

first_sibling = User.create(
  f_name: "Jennifer",
  l_name: "Peters",
  email: "jennifer@email.com",
  password: "abc123"
)

second_sibling = User.create(
  f_name: "Sarah",
  l_name: "Campbell",
  email: "sarah@email.com",
  password: "abc123"
)

third_sibling = User.create(
  f_name: "Emily",
  l_name: "Landman",
  email: "emily@email.com",
  password: "abc123"
)

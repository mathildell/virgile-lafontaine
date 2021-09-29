# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WebsiteConfig.create!( website_name: "App de Virgile", show_projects_links: true) unless WebsiteConfig.any?
Admin.create!( { "email"=>"mathildelucelucas@gmail.com",
                "encrypted_password"=>"$2a$12$S/VrY3YnardlxdjS2jdFd.EWA.yFTwYmIW0X7iJqWr5HbBEOV3Wcy",
                "name"=>"Mathilde"})
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(salutation: "Mr",
            firstname: "Gerald",
            lastname: "Ang",
            email: "geraldangw@gmail.com",
            contactnum: 98800333,
            address: "409A Upper Changi Road",
            zipcode: 486941,
            country: "Singapore",
            password:              "admin1234",
            password_confirmation: "admin1234",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

(0..30).each do |i|
    firstname = Faker::Name.first_name
    User.create(salutation: Faker::Name.prefix,
                firstname:  firstname,
                lastname: Faker::Name.last_name,
                email: "#{firstname}@gmail.com",
                contactnum: Faker::PhoneNumber.phone_number,
                address: Faker::Address.street_address,
                zipcode: Faker::Address.zip_code,
                country: Faker::Address.country,
                password:              "user1234",
                password_confirmation: "user1234",
                activated: true,
                activated_at: Time.zone.now)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

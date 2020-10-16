require 'faker'

Athlete.destroy_all
User.destroy_all

graduation_years = [2020, 2021, 2022, 2023]
male_heights = ["5' 5", "5' 6", "5' 7", "5' 8", "5' 9", "5' 10", "5' 11", "6' 1", "6' 2"]
female_heights = ["4' 11", "5' 1", "5' 2", "5' 3", "5' 4", "5' 5", "5' 6"]


User.create!(
    id: 1,
    first_name: "Colton", 
    last_name: "Kaiser", 
    username: "user",
    password: "12345"
)

#Seed male athletes
10.times do 
    Athlete.create!(
        image: "https://www.w3schools.com/howto/img_avatar.png", 
        full_name: Faker::Name.male_first_name + ' ' + Faker::Name.last_name, 
        phone_number: Faker::PhoneNumber.cell_phone, 
        address: Faker::Address.full_address, 
        height: male_heights.sample, 
        weight: rand(130..190), 
        birthday: Faker::Date.birthday(min_age: 13, max_age: 18), 
        positions: Faker::Sports::Football.position, 
        high_school: Faker::University.prefix + " High School", 
        graduation_year: graduation_years.sample, 
        gpa: rand(3.0..4.2).round(1),
        user_id: 1
    )
end

#Seed female athletes
10.times do 
    Athlete.create!(
        image: "https://www.w3schools.com/howto/img_avatar.png", 
        full_name: Faker::Name.female_first_name + ' ' + Faker::Name.last_name, 
        phone_number: Faker::PhoneNumber.cell_phone, 
        address: Faker::Address.full_address, 
        height: female_heights.sample, 
        weight: rand(100..140), 
        birthday: Faker::Date.birthday(min_age: 13, max_age: 18), 
        positions: Faker::Sports::Basketball.position, 
        high_school: Faker::University.prefix + " High School", 
        graduation_year: graduation_years.sample, 
        gpa: rand(3.0..4.2).round(1),
        user_id: 1
    )
end
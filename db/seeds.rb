# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "Deleting current Database entries...!"

type_of_event = ["wedding ceremony", "wedding party", "funeral", "vernisace"]
type_of_musician = ["Band", "Piano player", "Violinist", "Vocal"]

Musician.destroy_all
User.destroy_all
Package.destroy_all

puts "Creating users"
colleen = User.create!(first_name: "Colleen", last_name: "Brown", nickname: "Colleen", email: "colleen@colleen.com", password: "123456")
katja = User.create!(first_name: "Katja", last_name: "Löffler", nickname: "Katja", email: "katja@katja.com", password: "123456")
louise = User.create!(first_name: "Louise", last_name: "Wedel", nickname: "Louise", email: "louise@louise.com", password: "123456")
besher = User.create!(first_name: "Besher", last_name: "Albalkhi", nickname: "Besher",email: "besher@besher.com", password: "123456")
puts "created users"

puts "Creating Musicians"
10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: Faker::Address.city,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotifiy_link: Faker::Internet.url,
    user: colleen
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: Faker::Address.city,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotifiy_link: Faker::Internet.url,
    user: louise
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: Faker::Address.city,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotifiy_link: Faker::Internet.url,
    user: besher
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: Faker::Address.city,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotifiy_link: Faker::Internet.url,
    user: katja
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

puts "created #{Musician.count} musicians"

2.times do
  musicians.each do |musician|
    price = rand(200..300)
    hours = rand(2..5)
    packages.each { |package| package.musician.create!(price: price, hours: hours, musician_id: musician.id) }
  end
end

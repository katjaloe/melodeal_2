# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

type_of_musician = ["Vocal", "Drums", "Guitar", "Piano", "Violine" ]
location = ["Berlin", "Hanover", "Hamburg", "Cologne", "Stuttgart"]
description = [
  "I am a classically trained musician who uses my instrument to express the deepest emotions and truths of the human experience.",
  "I am a passionate and dedicated performer who seeks to create connections between music, performers, and audiences.",
  "As a classical musician, I strive to bring the beauty and complexity of centuries-old music to life in new and engaging ways.",
  "I am a classical musician who believes in the transformative power of music to heal, inspire, and connect people from all walks of life.",
  "I am a classically trained musician who embraces both the tradition and the innovation of the classical repertoire, constantly seeking to expand my musical horizons.",
  "As a classical musician, I aim to communicate the essence of the music through every note I play, bringing it to life with clarity and depth.",
  "I am a performer who believes in the power of music to create a sense of community and togetherness among people from diverse backgrounds.",
  "I am a classical musician who seeks to explore the depths of human emotion and experience through the expressive power of classical music.",
  "As a classical musician, I am constantly striving to push the boundaries of my own musicianship and create new and innovative interpretations of the classical repertoire.",
  "I am a classically trained musician who seeks to use music as a means of bridging cultural divides and bringing people together in harmony.",
  "I am a classical musician who is dedicated to bringing the full range of human experience to life through the power and beauty of music.",
  "As a performer, I am committed to using my talents to uplift and inspire others, connecting with my audience through the shared experience of music.",
  "I am a classically trained musician who sees music as a language that transcends words, uniting people across time and space through its universal beauty and power.",
  "I am a classical musician who embraces both the technical and emotional aspects of performance, seeking to convey the full richness and complexity of the music.",
  "As a classical musician, I strive to embody the traditions and values of the classical repertoire, while also bringing my own unique perspective and interpretation to each performance.",
  "I am a performer who is passionate about creating meaningful and unforgettable musical experiences that transport my audience to another world.",
  "I am a classical musician who believes in the power of music to evoke deep emotions and to help people connect with their inner selves and with one another.",
  "As a classical musician, I am dedicated to bringing the timeless beauty and meaning of classical music to contemporary audiences, while also honoring the rich history and traditions of the repertoire.",
  "I am a classically trained musician who seeks to use music as a means of promoting social justice and creating positive change in the world.",
  "I am a classical musician who approaches every performance with a sense of reverence and awe, seeking to create a profound connection with the music and with my audience.",
  "As a performer, I am constantly seeking to push the boundaries of my own musicianship, challenging myself to find new and innovative ways of interpreting the music.",
  "I am a classical musician who believes in the power of music to touch people's souls and to bring light and joy into their lives.",
  "I am a performer who strives to create an intimate and personal connection with my audience, inviting them to join me on a journey of discovery and emotional expression.",
  "As a classical musician, I seek to honor the great composers of the past while also exploring the possibilities of new and innovative approaches to the music.",
  "I am a classically trained musician who is dedicated to using my talents to serve my community and to create positive social change through the power of music.",
  "I am a classical musician who sees music as a universal language that can connect people from all cultures and backgrounds, inspiring empathy and understanding.",
  "As a performer, I am committed to creating performances that are both technically precise and emotionally authentic, creating a deep and lasting impact on my audience.",
  "I am a classical musician who seeks to use the power of music to inspire hope, resilience, and courage in people facing difficult times and situations.",
  "I am a performer who approaches every piece of music with a sense of curiosity and exploration, seeking to uncover new layers of meaning and emotion in each performance.",
  "As a classical musician, I am dedicated to preserving and promoting the rich cultural heritage of classical music, while also exploring new and exciting ways of interpreting the repertoire."
]

puts "Deleting current Database entries...!"

Review.destroy_all
Message.destroy_all
Booking.destroy_all
Package.destroy_all
Musician.destroy_all
User.destroy_all

puts "Creating users"
colleen = User.create!(first_name: "Colleen", last_name: "Brown", email: "colleen@colleen.com", password: "123456")
file_colleen = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673201251/tdk5i2gd1etzmwduejsy.jpg")
colleen.photo.attach(io: file_colleen, filename: "colleen.png", content_type: "image/png")
katja = User.create!(first_name: "Katja", last_name: "Löffler", email: "katja@katja.com", password: "123456")
file_katja = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673201177/uaqwpyl6xjs1hm2jfaq6.jpg")
katja.photo.attach(io: file_katja, filename: "katja.png", content_type: "image/png")
louise = User.create!(first_name: "Louise", last_name: "Wedel", email: "louise@louise.com", password: "123456")
file_louise = URI.open("https://avatars.githubusercontent.com/u/116000558?v=4")
louise.photo.attach(io: file_louise, filename: "louise.png", content_type: "image/png")
besher = User.create!(first_name: "Besher", last_name: "Albalkhi", email: "besher@besher.com", password: "123456")
file_besher = URI.open("https://avatars.githubusercontent.com/u/122227511?v=4")
besher.photo.attach(io: file_besher, filename: "besher.png", content_type: "image/png")
puts "created users"

puts "Creating Musicians"

  cello_female_1 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen

  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912646/joel-vogt-XAdPSpLhHpg-unsplash_qjpxke.jpg")
  cello_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_female_1.id
  )


piano_male_2 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Piano",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912159/soundtrap-BU816BGrP0U-unsplash_wia3rv.jpg")
piano_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id: piano_male_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id: piano_male_2.id
)


  cello_male_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912645/jeana-bala-atD181puoXM-unsplash_f5hflb.jpg")
  cello_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_male_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_male_1.id
  )

  guitar_male_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Guitar",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912157/thiago-borrere-alvim-bf8APnBxoCk-unsplash_fg2vtk.jpg")
  guitar_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: guitar_male_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: guitar_male_1.id
  )


  vocal_female_1 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Vocal",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912150/anish-prajapati-5Sxh_zg5Des-unsplash_njzpww.jpg")
  vocal_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: vocal_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: vocal_female_1.id
  )

  cello_male_2 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912154/kael-bloom-0Fko0cLI2VQ-unsplash_uj1ll3.jpg")
  cello_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_male_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_male_2.id
  )

  guitar_male_2 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Guitar",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912157/leonardo-zorzi-vVtkT4ny8hM-unsplash_d3jida.jpg")
  guitar_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  guitar_male_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  guitar_male_2.id
  )


  cello_female_2 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912158/sam-moghadam-khamseh-VMFLpCrDpFM-unsplash_ixeddf.jpg")
  cello_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  guitar_male_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  guitar_male_2.id
  )

  violin_female_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Violin",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912155/luwadlin-bosman-pD1KUHCZ9Yc-unsplash_dkp1ua.jpg")
  violin_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  violin_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  violin_female_1.id
  )


guitar_female_1 = Musician.create!(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Guitar",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912154/jakayla-toney-_SUo0bFBMRc-unsplash_urmkp6.jpg")
guitar_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  guitar_female_1.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  guitar_female_1.id
)


vocal_female_2 = Musician.create!(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Vocal",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912150/ben-collins-uPmfKSOT5f8-unsplash_b5coj3.jpg")
vocal_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  vocal_female_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  vocal_female_2.id
)


piano_male_1 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Piano",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912155/platforma-za-drustveni-centar-cakovec-JKSXxal-UAI-unsplash_t478ru.jpg")
piano_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  piano_male_1.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  piano_male_1.id
)


violin_female_2 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Violin",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912153/lena-grimalkin-Wx6zfKBUJXg-unsplash_putcqn.jpg")
violin_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')


Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  violin_female_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  violin_female_2.id
)


# 10.times do
#   musicians_katja = Musician.create!(
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: katja
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
#   musicians_katja.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

# 10.times do
#   musicians_louise = Musician.create!(
#     first_name: Faker::Name.female_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: louise
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
#   musicians_louise.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

# 10.times do
#   @musicians_besher = Musician.create!(
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: besher
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
#   @musicians_besher.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

puts "created #{Musician.count} musicians"

# puts "creating packages"

# Musician.all.each do |musician|
#   Package.create!(
#     description: "You will get 2 hours of live music. I can play every song you like!",
#     price: 200,
#     hours: 2,
#     musician_id: musician.id
#   )

#   Package.create!(
#     description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
#     price: 350,
#     hours: 4,
#     musician_id: musician.id
#   )
# end

# # @musicians_besher.each do |musician|
# #   Package.create!(
# #     description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
# #     price: 350,
# #     hours: 4,
# #     musician_id: musician.id
# #   )
# # end

# # Musician.all.each do |musician|
# #   Package.create!(
# #     description: "Package Large",
# #     price: rand(310..500),
# #     hours: rand(3..5),
# #     musician_id: musician.id
# #   )
# # end


# puts "created #{Package.count} packages"

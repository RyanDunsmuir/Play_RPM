# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
OrderSong.destroy_all

user = User.new
user.email = 'ryan_dunsmuir@hotmail.co.uk'
user.username = 'PeterProducer'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.encrypted_password = '#$taawktljasktlw4aaglj'
user.save!

40.times do
  rand_seed_gen = Faker::Number.number(digits: 8)
  title = Faker::Music::Prince.song
  artist = Faker::Music.band
  album = Faker::Music.album
  cover = "https://picsum.photos/seed/#{rand_seed_gen}/400/400"
  song = Song.new(title: title, artist: artist, album: album, cover: cover, user: user)
  puts "added #{song.title} - #{song.album} - #{song.artist}"
  song.save
end

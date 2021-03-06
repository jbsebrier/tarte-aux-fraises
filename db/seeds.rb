# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Swipe.destroy_all
Message.destroy_all
Event.destroy_all
Theme.destroy_all
Badge.destroy_all
Couple.destroy_all

[{name: "APERO", image_path: "apero.png"}, {name: "AFTERWORK", image_path: "afterwork.png"}, {name: "DINER", image_path: "diner.png"}, {name: "PIQUE-NIQUE", image_path: "pique_nique.png"},{name: "BRUNCH", image_path: "brunch.png"}, {name: "BAL MASQUE", image_path: "bal_masque.png"},{ name: "DANSE", image_path: "danse.png"}, {name: "SOIRE COQUINE", image_path: "coquin.png"}, {name: "POCHETTE SURPRISE", image_path: "surprise.png"}].each do |theme|
  Theme.create(theme)
end

{
  "Maitresse de Maison" => "https://res.cloudinary.com/drahqhchg/image/upload/v1469629121/maitresse_lqdxoh.png",
  "Touche a tout" => "https://res.cloudinary.com/drahqhchg/image/upload/v1469629122/tout_zseuwo.png",
  "Gourmand" => "https://res.cloudinary.com/drahqhchg/image/upload/v1469629121/gourmand_vynonk.png"
  }.each do |name, url|
    bdg = Badge.new(name: name)
    bdg.icon_url = url
    bdg.save!
end



Couple.create(email: '1stcouple@gmail.com', couple_nickname: 'couple1', password: '123456', member1_name: 'Jon', member2_name: 'Jane', about_member1: 'Sport fan', about_member2: 'Cooking fan')
Couple.create(email: '2ndcouple@gmail.com', couple_nickname: 'couple2', password: '123456', member1_name: 'Jackie', member2_name: 'Michel', about_member1: 'Fist fan', about_member2: 'Leather fan')
Couple.create(email: '3rdcouple@gmail.com', couple_nickname: 'couple3', password: '123456', member1_name: 'Laurel', member2_name: 'Hardy', about_member1: 'Humour fan', about_member2: 'Humour fan')
Couple.create(email: '4thcouple@gmail.com', couple_nickname: 'couple4', password: '123456', member1_name: 'Astérix', member2_name: 'Obélix', about_member1: 'Moustache fan', about_member2: 'Sanglier fan')
Couple.create(email: '5thcouple@gmail.com', couple_nickname: 'couple5', password: '123456', member1_name: 'Marie', member2_name: 'Mary', about_member1: 'Shopping fan', about_member2: 'Climbing fan')

Couple.all.each do |couple|
 5.times do
 couple.events.create!(
   date: Faker::Date.between(1.day.ago, 1.year.from_now),
   city: FFaker::AddressFR.city,

   description: "#{["Diner", "Dejeuner"].sample} chez #{couple.member1_name} & #{couple.member2_name}",
   max_n_guest_couples: Faker::Number.between(1, 4),
   theme: Theme.all.sample
 )
 end
end

# Swipe.create(event_id: 284, couple_id: 32, organizing_couple_swipe_result: true)
# Swipe.create(event_id: 283, couple_id: 32, organizing_couple_swipe_result: true)

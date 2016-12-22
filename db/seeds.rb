# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 AdminUser.create!(email: 'okancancosar@gmail.com', password: '121212', password_confirmation: '121212')
 AdminUser.create!(email: 'erdemgencoglu@gmail.com', password: '12253030', password_confirmation: '12253030')

Skill.create(
  name: "Yönetici",
  description: "Yönetici burda",
  color: "#000000",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "y.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "81636",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)
Skill.create(
  name: "Uzman",
  description: "Konusunda uzman kişiler",
  color: "#4f2222",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "uzman.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "83017",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)
Skill.create(
  name: "Mezun",
  description: "Mezun kişiler",
  color: "#65531",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "mezun.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "84934",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)
Skill.create(
  name: "Hizmet Personeli",
  description: "Hizmet personeli",
  color: "#0256",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "hizmetPersoneli.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "94704",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)
Skill.create(
  name: "İşçi",
  description: "İşçi ",
  color: "#684554",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "isci.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "98626",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)
Skill.create(
  name: "Engelli",
  description: "Engelli yetenekleri",
  color: "#98754",
  created_at: "2016-12-21 18:32:21",
  updated_at: "2016-12-21 18:32:21",
  skill_icon_file_name: "engelli.png",
  skill_icon_content_type: "image/jpeg",
  skill_icon_file_size: "92628",
  skill_icon_updated_at: "2016-12-21 18:32:21"
)

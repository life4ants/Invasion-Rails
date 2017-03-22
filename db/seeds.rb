# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


names = ["Skyman1", "Babyman2", "Blueguy3", "Catman4", "Inky5", "erkerla6", "Bimbo7", "Ashumashu8"]

8.times do |n|
  name  = names[n]
  email = "example-#{n+1}@invasion.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

User.create!(name: "Admin",
             email: "admin@invasion.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


countryInfo =
[{name: "Alaska",                group: "North America", subgroup: "Canada",          borders: [2, 3]},
{name: "Yukon Territory",        group: "North America", subgroup: "Canada",          borders: [1, 3, 4]},
{name: "British Columbia",       group: "North America", subgroup: "Canada",          borders: [1, 2, 4, 5, 48, 49, 50]},
{name: "Northwest Territories",  group: "North America", subgroup: "Canada",          borders: [2, 3, 5, 6, 7]},
{name: "Alberta",                group: "North America", subgroup: "Canada",          borders: [3, 4, 6, 48]},
{name: "Saskatchewan",           group: "North America", subgroup: "Canada",          borders: [4, 5, 7, 8, 39, 48]},
{name: "Nunavut",                group: "North America", subgroup: "Canada",          borders: [4, 6, 8, 10]},
{name: "Manitoba",               group: "North America", subgroup: "Canada",          borders: [6, 7, 9, 38, 39]},
{name: "Ontario",                group: "North America", subgroup: "Canada",          borders: [8, 10, 17, 24, 38]},
{name: "Quebec",                 group: "North America", subgroup: "Canada",          borders: [7, 9, 11, 12, 14, 15, 16, 17]},
{name: "Labrador",               group: "North America", subgroup: "Canada",          borders: [10, 12]},
{name: "Newfoundland",           group: "North America", subgroup: "Canada",          borders: [10, 11, 13]},
{name: "Nova Scotia",            group: "North America", subgroup: "Canada",          borders: [12, 14]},
{name: "New Brunswick",          group: "North America", subgroup: "Canada",          borders: [10, 13, 15]},
{name: "Maine",                  group: "North America", subgroup: "Northeastern US", borders: [10, 14, 16]},
{name: "Massachusetts",          group: "North America", subgroup: "Northeastern US", borders: [10, 15, 17]},
{name: "New York",               group: "North America", subgroup: "Northeastern US", borders: [9, 10, 16, 18]},
{name: "Pennsylvania",           group: "North America", subgroup: "Northeastern US", borders: [17, 19, 20, 21]},
{name: "Virginia",               group: "North America", subgroup: "Northeastern US", borders: [18, 20, 22, 27, 28]},
{name: "West Virginia",          group: "North America", subgroup: "Northeastern US", borders: [18, 19, 21, 22]},
{name: "Ohio",                   group: "North America", subgroup: "Northeastern US", borders: [18, 20, 22, 23, 24]},
{name: "Kentucy",                group: "North America", subgroup: "Northeastern US", borders: [19, 20, 21, 23, 26, 27, 36]},
{name: "Indiana",                group: "North America", subgroup: "Northeastern US", borders: [21, 22, 24, 26]},
{name: "Michigan",               group: "North America", subgroup: "Northeastern US", borders: [9, 21, 23, 25]},
{name: "Wisconsin",              group: "North America", subgroup: "Northeastern US", borders: [24, 26, 37, 38]},
{name: "Illinois",               group: "North America", subgroup: "Northeastern US", borders: [22, 23, 25, 36, 37]},
{name: "Tennessee",              group: "North America", subgroup: "Southeastern US", borders: [19, 22, 28, 30, 32, 33, 35, 36]},
{name: "North Carolina",         group: "North America", subgroup: "Southeastern US", borders: [19, 27, 29, 30]},
{name: "South Carolina",         group: "North America", subgroup: "Southeastern US", borders: [28, 30]},
{name: "Georgia",                group: "North America", subgroup: "Southeastern US", borders: [27, 28, 29, 31, 32]},
{name: "Florida",                group: "North America", subgroup: "Southeastern US", borders: [30, 32, 87, 88]},
{name: "Alabama",                group: "North America", subgroup: "Southeastern US", borders: [27, 30, 31, 33]},
{name: "Mississippi",            group: "North America", subgroup: "Southeastern US", borders: [27, 32, 34, 35]},
{name: "Louisiana",              group: "North America", subgroup: "Central US",      borders: [33, 35, 44]},
{name: "Arkansas",               group: "North America", subgroup: "Central US",      borders: [27, 33, 34, 36, 43, 44]},
{name: "Missouri",               group: "North America", subgroup: "Central US",      borders: [22, 26, 27, 35, 37, 41, 42, 43]},
{name: "Iowa",                   group: "North America", subgroup: "Central US",      borders: [25, 26, 36, 38, 40, 41]},
{name: "Minnesota",              group: "North America", subgroup: "Central US",      borders: [8, 9, 25, 37, 39, 40]},
{name: "North Dakota",           group: "North America", subgroup: "Central US",      borders: [6, 8, 38, 40, 48]},
{name: "South Dakota",           group: "North America", subgroup: "Central US",      borders: [37, 38, 39, 41, 47, 48]},
{name: "Nebraska",               group: "North America", subgroup: "Central US",      borders: [36, 37, 40, 42, 46, 47]},
{name: "Kansas",                 group: "North America", subgroup: "Central US",      borders: [36, 41, 43, 46]},
{name: "Oklahoma",               group: "North America", subgroup: "Central US",      borders: [35, 36, 42, 44, 45, 46]},
{name: "Texas",                  group: "North America", subgroup: "Central US",      borders: [34, 35, 43, 45, 60, 61, 67]},
{name: "New Mexico",             group: "North America", subgroup: "Central US",      borders: [43, 44, 46, 55, 57, 60]},
{name: "Colorado",               group: "North America", subgroup: "Central US",      borders: [41, 42, 43, 45, 47, 54]},
{name: "Wyoming",                group: "North America", subgroup: "Central US",      borders: [40, 41, 46, 48, 49, 54]},
{name: "Montana",                group: "North America", subgroup: "Central US",      borders: [3, 5, 6, 39, 40, 47, 49]},
{name: "Idaho",                  group: "North America", subgroup: "Western US",      borders: [3, 47, 48, 50, 51, 53, 54]},
{name: "Washington",             group: "North America", subgroup: "Western US",      borders: [3, 49, 51]},
{name: "Oregon",                 group: "North America", subgroup: "Western US",      borders: [49, 50, 52, 53]},
{name: "California",             group: "North America", subgroup: "Western US",      borders: [51, 53, 55, 56]},
{name: "Nevada",                 group: "North America", subgroup: "Western US",      borders: [49, 51, 52, 54, 55]},
{name: "Utah",                   group: "North America", subgroup: "Western US",      borders: [46, 47, 49, 53, 55]},
{name: "Arizona",                group: "North America", subgroup: "Western US",      borders: [45, 52, 53, 54, 56, 57]},
{name: "Baja California",        group: "North America", subgroup: "Northern Mexico", borders: [52, 55, 57, 58]},
{name: "Sonora",                 group: "North America", subgroup: "Northern Mexico", borders: [45, 55, 56, 58, 59, 60]},
{name: "Baja Calif. de Sur",     group: "North America", subgroup: "Northern Mexico", borders: [56, 57, 59]},
{name: "Sinaloa",                group: "North America", subgroup: "Northern Mexico", borders: [57, 58, 60, 62, 63]},
{name: "Chihuahua",              group: "North America", subgroup: "Northern Mexico", borders: [44, 45, 57, 59, 61, 62]},
{name: "Coahuila",               group: "North America", subgroup: "Northern Mexico", borders: [44, 60, 62, 64, 66, 67]},
{name: "Durango",                group: "North America", subgroup: "Northern Mexico", borders: [59, 60, 61, 63, 64]},
{name: "Nayarit",                group: "North America", subgroup: "Northern Mexico", borders: [59, 62, 64, 71]},
{name: "Zacatecas",              group: "North America", subgroup: "Northern Mexico", borders: [61, 62, 63, 65, 66, 70, 71]},
{name: "San Luis Potosi",        group: "North America", subgroup: "Northern Mexico", borders: [64, 66, 67, 68, 69, 70]},
{name: "Nuevo Leon",             group: "North America", subgroup: "Northern Mexico", borders: [61, 64, 65, 67]},
{name: "Tamaulipas",             group: "North America", subgroup: "Northern Mexico", borders: [44, 61, 65, 66, 68]},
{name: "Veracruz",               group: "North America", subgroup: "Southern Mexico", borders: [65, 67, 69, 74, 75, 76]},
{name: "Puebla",                 group: "North America", subgroup: "Southern Mexico", borders: [65, 68, 70, 72, 73, 74]},
{name: "Guanajuato",             group: "North America", subgroup: "Southern Mexico", borders: [64, 65, 69, 71, 72]},
{name: "Jalisco",                group: "North America", subgroup: "Southern Mexico", borders: [63, 64, 70, 72]},
{name: "Michoacan",              group: "North America", subgroup: "Southern Mexico", borders: [69, 70, 71, 73]},
{name: "Guerrero",               group: "North America", subgroup: "Southern Mexico", borders: [69, 72, 74]},
{name: "Oaxaca",                 group: "North America", subgroup: "Southern Mexico", borders: [68, 69, 73, 75]},
{name: "Chiapas",                group: "North America", subgroup: "Southern Mexico", borders: [68, 74, 76, 80]},
{name: "Campeche",               group: "North America", subgroup: "Southern Mexico", borders: [68, 75, 77, 78, 80]},
{name: "Yucatan",                group: "North America", subgroup: "Southern Mexico", borders: [76, 78]},
{name: "Quintana Roo",           group: "North America", subgroup: "Southern Mexico", borders: [76, 77, 79, 80, 87]},
{name: "Belize",                 group: "North America", subgroup: "Central America", borders: [78, 80, 82]},
{name: "Guatemala",              group: "North America", subgroup: "Central America", borders: [75, 76, 78, 79, 81, 82]},
{name: "El Salvador",            group: "North America", subgroup: "Central America", borders: [80, 82, 83]},
{name: "Honduras",               group: "North America", subgroup: "Central America", borders: [79, 80, 81, 83]},
{name: "Nicaragua",              group: "North America", subgroup: "Central America", borders: [81, 82, 84]},
{name: "Costa Rica",             group: "North America", subgroup: "Central America", borders: [83, 85]},
{name: "Panama",                 group: "North America", subgroup: "Central America", borders: [84]},
{name: "Jamaica",                group: "North America", subgroup: "the Caribbean",   borders: [87, 89]},
{name: "Cuba",                   group: "North America", subgroup: "the Caribbean",   borders: [31, 78, 86, 88, 89]},
{name: "Bahamas",                group: "North America", subgroup: "the Caribbean",   borders: [31, 87, 90]},
{name: "Haiti",                  group: "North America", subgroup: "the Caribbean",   borders: [86, 87, 90]},
{name: "Dominican Republic",     group: "North America", subgroup: "the Caribbean",   borders: [88, 89]}]



90.times do |n|
  Territory.create!(countryInfo[n])
end

Game.create!(nick_name: "first game", num_of_players: 4, random_select: true, wins_tie: false, num_of_cards: 15)
Player.create!(game_id: 1, user_id: 1, admin: true, icon: 57)
Player.create!(game_id: 1, user_id: 2, icon: 74)
Player.create!(game_id: 1, user_id: 3, icon: 62)

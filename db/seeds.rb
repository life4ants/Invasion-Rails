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
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

User.create!(name:  "Brother Andy",
             email: "brotherandy@live.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


_countryInfo = []
91.times do |n|
  _countryInfo.push({})
end


_countryInfo[1][:name] = "Alaska"
_countryInfo[1][:borders] = [2,3]
_countryInfo[2][:name] = "Yukon Territory"
_countryInfo[2][:borders] = [1,3,4]
_countryInfo[3][:name] = "British Columbia"
_countryInfo[3][:borders] = [1,2,4,5,48,49,50]
_countryInfo[4][:name] = "Northwest Territories"
_countryInfo[4][:borders] = [2,3,5,6,7]
_countryInfo[5][:name] = "Alberta"
_countryInfo[5][:borders] = [3,4,6,48]
_countryInfo[6][:name] = "Saskatchewan"
_countryInfo[6][:borders] = [4,5,7,8,39,48]
_countryInfo[7][:name] = "Nunavut"
_countryInfo[7][:borders] = [4,6,8,10]
_countryInfo[8][:name] = "Manitoba"
_countryInfo[8][:borders] = [6,7,9,38,39]
_countryInfo[9][:name] = "Ontario"
_countryInfo[9][:borders] = [8,10,17,24,38]
_countryInfo[10][:name] = "Quebec"
_countryInfo[10][:borders] = [7,9,11,12,14,15,16,17]
_countryInfo[11][:name] = "Labrador"
_countryInfo[11][:borders] = [10,12]
_countryInfo[12][:name] = "Newfoundland"
_countryInfo[12][:borders] = [10,11,13]
_countryInfo[13][:name] = "Nova Scotia"
_countryInfo[13][:borders] = [12,14]
_countryInfo[14][:name] = "New Brunswick"
_countryInfo[14][:borders] = [10,13,15]
_countryInfo[15][:name] = "Maine"
_countryInfo[15][:borders] = [10,14,16]
_countryInfo[16][:name] = "Massachusetts"
_countryInfo[16][:borders] = [10,15,17]
_countryInfo[17][:name] = "New York"
_countryInfo[17][:borders] = [9,10,16,18]
_countryInfo[18][:name] = "Pennsylvania"
_countryInfo[18][:borders] = [17,19,20,21]
_countryInfo[19][:name] = "Virginia"
_countryInfo[19][:borders] = [18,20,22,27,28]
_countryInfo[20][:name] = "West Virginia"
_countryInfo[20][:borders] = [18,19,21,22]
_countryInfo[21][:name] = "Ohio"
_countryInfo[21][:borders] = [18,20,22,23,24]
_countryInfo[22][:name] = "Kentucy"
_countryInfo[22][:borders] = [19,20,21,23,26,27,36]
_countryInfo[23][:name] = "Indiana"
_countryInfo[23][:borders] = [21,22,24,26]
_countryInfo[24][:name] = "Michigan"
_countryInfo[24][:borders] = [9,21,23,25]
_countryInfo[25][:name] = "Wisconsin"
_countryInfo[25][:borders] = [24,26,37,38]
_countryInfo[26][:name] = "Illinois"
_countryInfo[26][:borders] = [22,23,25,36,37]
_countryInfo[27][:name] = "Tennessee"
_countryInfo[27][:borders] = [19,22,28,30,32,33,35,36]
_countryInfo[28][:name] = "North Carolina"
_countryInfo[28][:borders] = [19,27,29,30]
_countryInfo[29][:name] = "South Carolina"
_countryInfo[29][:borders] = [28,30]
_countryInfo[30][:name] = "Georgia"
_countryInfo[30][:borders] = [27,28,29,31,32]
_countryInfo[31][:name] = "Florida"
_countryInfo[31][:borders] = [30,32,87,88]
_countryInfo[32][:name] = "Alabama"
_countryInfo[32][:borders] = [27,30,31,33]
_countryInfo[33][:name] = "Mississippi"
_countryInfo[33][:borders] = [27,32,34,35]
_countryInfo[34][:name] = "Louisiana"
_countryInfo[34][:borders] = [33,35,44]
_countryInfo[35][:name] = "Arkansas"
_countryInfo[35][:borders] = [27,33,34,36,43,44]
_countryInfo[36][:name] = "Missouri"
_countryInfo[36][:borders] = [22,26,27,35,37,41,42,43]
_countryInfo[37][:name] = "Iowa"
_countryInfo[37][:borders] = [25,26,36,38,40,41]
_countryInfo[38][:name] = "Minnesota"
_countryInfo[38][:borders] = [8,9,25,37,39,40]
_countryInfo[39][:name] = "North Dakota"
_countryInfo[39][:borders] = [6,8,38,40,48]
_countryInfo[40][:name] = "South Dakota"
_countryInfo[40][:borders] = [37,38,39,41,47,48]
_countryInfo[41][:name] = "Nebraska"
_countryInfo[41][:borders] = [36,37,40,42,46,47]
_countryInfo[42][:name] = "Kansas"
_countryInfo[42][:borders] = [36,41,43,46]
_countryInfo[43][:name] = "Oklahoma"
_countryInfo[43][:borders] = [35,36,42,44,45,46]
_countryInfo[44][:name] = "Texas"
_countryInfo[44][:borders] = [34,35,43,45,60,61,67]
_countryInfo[45][:name] = "New Mexico"
_countryInfo[45][:borders] = [43,44,46,55,57,60]
_countryInfo[46][:name] = "Colorado"
_countryInfo[46][:borders] = [41,42,43,45,47,54]
_countryInfo[47][:name] = "Wyoming"
_countryInfo[47][:borders] = [40,41,46,48,49,54]
_countryInfo[48][:name] = "Montana"
_countryInfo[48][:borders] = [3,5,6,39,40,47,49]
_countryInfo[49][:name] = "Idaho"
_countryInfo[49][:borders] = [3,47,48,50,51,53,54]
_countryInfo[50][:name] = "Washington"
_countryInfo[50][:borders] = [3,49,51]
_countryInfo[51][:name] = "Oregon"
_countryInfo[51][:borders] = [49,50,52,53]
_countryInfo[52][:name] = "California"
_countryInfo[52][:borders] = [51,53,55,56]
_countryInfo[53][:name] = "Nevada"
_countryInfo[53][:borders] = [49,51,52,54,55]
_countryInfo[54][:name] = "Utah"
_countryInfo[54][:borders] = [46,47,49,53,55]
_countryInfo[55][:name] = "Arizona"
_countryInfo[55][:borders] = [45,52,53,54,56,57]
_countryInfo[56][:name] = "Baja California"
_countryInfo[56][:borders] = [52,55,57,58]
_countryInfo[57][:name] = "Sonora"
_countryInfo[57][:borders] = [45,55,56,58,59,60]
_countryInfo[58][:name] = "Baja Calif. de Sur"
_countryInfo[58][:borders] = [56,57,59]
_countryInfo[59][:name] = "Sinaloa"
_countryInfo[59][:borders] = [57,58,60,62,63]
_countryInfo[60][:name] = "Chihuahua"
_countryInfo[60][:borders] = [44,45,57,59,61,62]
_countryInfo[61][:name] = "Coahuila"
_countryInfo[61][:borders] = [44,60,62,64,66,67]
_countryInfo[62][:name] = "Durango"
_countryInfo[62][:borders] = [59,60,61,63,64]
_countryInfo[63][:name] = "Nayarit"
_countryInfo[63][:borders] = [59,62,64,71]
_countryInfo[64][:name] = "Zacatecas"
_countryInfo[64][:borders] = [61,62,63,65,66,70,71]
_countryInfo[65][:name] = "San Luis Potosi"
_countryInfo[65][:borders] = [64,66,67,68,69,70]
_countryInfo[66][:name] = "Nuevo Leon"
_countryInfo[66][:borders] = [61,64,65,67]
_countryInfo[67][:name] = "Tamaulipas"
_countryInfo[67][:borders] = [44,61,65,66,68]
_countryInfo[68][:name] = "Veracruz"
_countryInfo[68][:borders] = [65,67,69,74,75,76]
_countryInfo[69][:name] = "Puebla"
_countryInfo[69][:borders] = [65,68,70,72,73,74]
_countryInfo[70][:name] = "Guanajuato"
_countryInfo[70][:borders] = [64,65,69,71,72]
_countryInfo[71][:name] = "Jalisco"
_countryInfo[71][:borders] = [63,64,70,72]
_countryInfo[72][:name] = "Michoacan"
_countryInfo[72][:borders] = [69,70,71,73]
_countryInfo[73][:name] = "Guerrero"
_countryInfo[73][:borders] = [69,72,74]
_countryInfo[74][:name] = "Oaxaca"
_countryInfo[74][:borders] = [68,69,73,75]
_countryInfo[75][:name] = "Chiapas"
_countryInfo[75][:borders] = [68,74,76,80]
_countryInfo[76][:name] = "Campeche"
_countryInfo[76][:borders] = [68,75,77,78,80]
_countryInfo[77][:name] = "Yucatan"
_countryInfo[77][:borders] = [76,78]
_countryInfo[78][:name] = "Quintana Roo"
_countryInfo[78][:borders] = [76,77,79,80,87]
_countryInfo[79][:name] = "Belize"
_countryInfo[79][:borders] = [78,80,82]
_countryInfo[80][:name] = "Guatemala"
_countryInfo[80][:borders] = [75,76,78,79,81,82]
_countryInfo[81][:name] = "El Salvador"
_countryInfo[81][:borders] = [80,82,83]
_countryInfo[82][:name] = "Honduras"
_countryInfo[82][:borders] = [79,80,81,83]
_countryInfo[83][:name] = "Nicaragua"
_countryInfo[83][:borders] = [81,82,84]
_countryInfo[84][:name] = "Costa Rica"
_countryInfo[84][:borders] = [83,85]
_countryInfo[85][:name] = "Panama"
_countryInfo[85][:borders] = [84]
_countryInfo[86][:name] = "Jamaica"
_countryInfo[86][:borders] = [87,89]
_countryInfo[87][:name] = "Cuba"
_countryInfo[87][:borders] = [31,78,86,88,89]
_countryInfo[88][:name] = "Bahamas"
_countryInfo[88][:borders] = [31,87,90]
_countryInfo[89][:name] = "Haiti"
_countryInfo[89][:borders] = [86,87,90]
_countryInfo[90][:name] = "Dominican Republic"
_countryInfo[90][:borders] = [88,89]


90.times do |n|
  TerritoryBorder.create!(name:  _countryInfo[n+1][:name],
              borders: _countryInfo[n+1][:borders])
end

Game.create!(nick_name: "first game", num_of_players: 3, random_select: true, wins_tie: false, num_of_cards: 15)
Player.create!(game_id: 1, user_id: 2, admin: true, icon: 74)
Player.create!(game_id: 1, user_id: 3, icon: 38)

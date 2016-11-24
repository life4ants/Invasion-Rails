# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

_countryInfo = []
90.times do |n|
  _countryInfo.push({})
end


        _countryInfo[0][:name] = "Alaska"
        _countryInfo[0][:borders] = [1,2]
        _countryInfo[1][:name] = "Yukon Territory"
        _countryInfo[1][:borders] = [0,2,3]
        _countryInfo[2][:name] = "British Columbia"
        _countryInfo[2][:borders] = [0,1,3,4,47,48,49]
        _countryInfo[3][:name] = "Northwest Territories"
        _countryInfo[3][:borders] = [1,2,4,5,6] 
        _countryInfo[4][:name] = "Alberta"
        _countryInfo[4][:borders] = [2,3,5,47]
        _countryInfo[5][:name] = "Saskatchewan"
        _countryInfo[5][:borders] = [3,4,6,7,38,47] 
        _countryInfo[6][:name] = "Nunavut"
        _countryInfo[6][:borders] = [3,5,7,9] 
        _countryInfo[7][:name] = "Manitoba"
        _countryInfo[7][:borders] = [5,6,8,37,38] 
        _countryInfo[8][:name] = "Ontario"
        _countryInfo[8][:borders] = [7,9,16,23,37] 
        _countryInfo[9][:name] = "Quebec"
        _countryInfo[9][:borders] = [6,8,10,11,13,14,15,16] 
        _countryInfo[10][:name] = "Labrador"
        _countryInfo[10][:borders] = [9,11]
        _countryInfo[11][:name] = "Newfoundland"
        _countryInfo[11][:borders] = [9,10,12]
        _countryInfo[12][:name] = "Nova Scotia"
        _countryInfo[12][:borders] = [11,13]
        _countryInfo[13][:name] = "New Brunswick"
        _countryInfo[13][:borders] = [9,12,14]
        _countryInfo[14][:name] = "Maine"
        _countryInfo[14][:borders] = [9,13,15]
        _countryInfo[15][:name] = "Massachusetts"
        _countryInfo[15][:borders] = [9,14,16]
        _countryInfo[16][:name] = "New York"
        _countryInfo[16][:borders] = [8,9,15,17] 
        _countryInfo[17][:name] = "Pennsylvania"
        _countryInfo[17][:borders] = [16,18,19,20]
        _countryInfo[18][:name] = "Virginia"
        _countryInfo[18][:borders] = [17,19,21,26,27] 
        _countryInfo[19][:name] = "West Virginia"
        _countryInfo[19][:borders] = [17,18,20,21]
        _countryInfo[20][:name] = "Ohio"
        _countryInfo[20][:borders] = [17,19,21,22,23] 
        _countryInfo[21][:name] = "Kentucy"
        _countryInfo[21][:borders] = [18,19,20,22,25,26,35]
        _countryInfo[22][:name] = "Indiana"
        _countryInfo[22][:borders] = [20,21,23,25]
        _countryInfo[23][:name] = "Michigan"
        _countryInfo[23][:borders] = [8,20,22,24]
        _countryInfo[24][:name] = "Wisconsin"
        _countryInfo[24][:borders] = [23,25,36,37]
        _countryInfo[25][:name] = "Illinois"
        _countryInfo[25][:borders] = [21,22,24,35,36]
        _countryInfo[26][:name] = "Tennessee"
        _countryInfo[26][:borders] = [18,21,27,29,31,32,34,35]
        _countryInfo[27][:name] = "North Carolina"
        _countryInfo[27][:borders] = [18,26,28,29]
        _countryInfo[28][:name] = "South Carolina"
        _countryInfo[28][:borders] = [27,29]
        _countryInfo[29][:name] = "Georgia"
        _countryInfo[29][:borders] = [26,27,28,30,31]
        _countryInfo[30][:name] = "Florida"
        _countryInfo[30][:borders] = [29,31,86,87]
        _countryInfo[31][:name] = "Alabama"
        _countryInfo[31][:borders] = [26,29,30,32]
        _countryInfo[32][:name] = "Mississippi"
        _countryInfo[32][:borders] = [26,31,33,34]
        _countryInfo[33][:name] = "Louisiana"
        _countryInfo[33][:borders] = [32,34,43]
        _countryInfo[34][:name] = "Arkansas"
        _countryInfo[34][:borders] = [26,32,33,35,42,43]
        _countryInfo[35][:name] = "Missouri"
        _countryInfo[35][:borders] = [21,25,26,34,36,40,41,42]
        _countryInfo[36][:name] = "Iowa"
        _countryInfo[36][:borders] = [24,25,35,37,39,40]
        _countryInfo[37][:name] = "Minnesota"
        _countryInfo[37][:borders] = [7,8,24,36,38,39]
        _countryInfo[38][:name] = "North Dakota"
        _countryInfo[38][:borders] = [5,7,37,39,47]
        _countryInfo[39][:name] = "South Dakota"
        _countryInfo[39][:borders] = [36,37,38,40,46,47]
        _countryInfo[40][:name] = "Nebraska"
        _countryInfo[40][:borders] = [35,36,39,41,45,46]
        _countryInfo[41][:name] = "Kansas"
        _countryInfo[41][:borders] = [35,40,42,45]
        _countryInfo[42][:name] = "Oklahoma"
        _countryInfo[42][:borders] = [34,35,41,43,44,45]
        _countryInfo[43][:name] = "Texas"
        _countryInfo[43][:borders] = [33,34,42,44,59,60,66]
        _countryInfo[44][:name] = "New Mexico"
        _countryInfo[44][:borders] = [42,43,45,54,56,59]
        _countryInfo[45][:name] = "Colorado"
        _countryInfo[45][:borders] = [40,41,42,44,46,53]
        _countryInfo[46][:name] = "Wyoming"
        _countryInfo[46][:borders] = [39,40,45,47,48,53]
        _countryInfo[47][:name] = "Montana"
        _countryInfo[47][:borders] = [2,4,5,38,39,46,48]
        _countryInfo[48][:name] = "Idaho"
        _countryInfo[48][:borders] = [2,46,47,49,50,52,53]
        _countryInfo[49][:name] = "Washington"
        _countryInfo[49][:borders] = [2,48,50]
        _countryInfo[50][:name] = "Oregon"
        _countryInfo[50][:borders] = [48,49,51,52]
        _countryInfo[51][:name] = "California"
        _countryInfo[51][:borders] = [50,52,54,55]
        _countryInfo[52][:name] = "Nevada"
        _countryInfo[52][:borders] = [48,50,51,53,54]
        _countryInfo[53][:name] = "Utah"
        _countryInfo[53][:borders] = [45,46,48,52,54]
        _countryInfo[54][:name] = "Arizona"
        _countryInfo[54][:borders] = [44,51,52,53,55,56]
        _countryInfo[55][:name] = "Baja California"
        _countryInfo[55][:borders] = [51,54,56,57]
        _countryInfo[56][:name] = "Sonora"
        _countryInfo[56][:borders] = [44,54,55,57,58,59]
        _countryInfo[57][:name] = "Baja Calif. de Sur"
        _countryInfo[57][:borders] = [55,56,58]
        _countryInfo[58][:name] = "Sinaloa"
        _countryInfo[58][:borders] = [56,57,59,61,62]
        _countryInfo[59][:name] = "Chihuahua"
        _countryInfo[59][:borders] = [43,44,56,58,60,61]
        _countryInfo[60][:name] = "Coahuila"
        _countryInfo[60][:borders] = [43,59,61,63,65,66]
        _countryInfo[61][:name] = "Durango"
        _countryInfo[61][:borders] = [58,59,60,62,63]
        _countryInfo[62][:name] = "Nayarit"
        _countryInfo[62][:borders] = [58,61,63,70]
        _countryInfo[63][:name] = "Zacatecas"
        _countryInfo[63][:borders] = [60,61,62,64,65,69,70]
        _countryInfo[64][:name] = "San Luis Potosi"
        _countryInfo[64][:borders] = [63,65,66,67,68,69]
        _countryInfo[65][:name] = "Nuevo Leon"
        _countryInfo[65][:borders] = [60,63,64,66]
        _countryInfo[66][:name] = "Tamaulipas"
        _countryInfo[66][:borders] = [43,60,64,65,67]
        _countryInfo[67][:name] = "Veracruz"
        _countryInfo[67][:borders] = [64,66,68,73,74,75]
        _countryInfo[68][:name] = "Puebla"
        _countryInfo[68][:borders] = [64,67,69,71,72,73]
        _countryInfo[69][:name] = "Guanajuato"
        _countryInfo[69][:borders] = [63,64,68,70,71]
        _countryInfo[70][:name] = "Jalisco"
        _countryInfo[70][:borders] = [62,63,69,71]
        _countryInfo[71][:name] = "Michoacan"
        _countryInfo[71][:borders] = [68,69,70,72]
        _countryInfo[72][:name] = "Guerrero"
        _countryInfo[72][:borders] = [68,71,73]
        _countryInfo[73][:name] = "Oaxaca"
        _countryInfo[73][:borders] = [67,68,72,74]
        _countryInfo[74][:name] = "Chiapas"
        _countryInfo[74][:borders] = [67,73,75,79]
        _countryInfo[75][:name] = "Campeche"
        _countryInfo[75][:borders] = [67,74,76,77,79]
        _countryInfo[76][:name] = "Yucatan"
        _countryInfo[76][:borders] = [75,77]
        _countryInfo[77][:name] = "Quintana Roo"
        _countryInfo[77][:borders] = [75,76,78,79,86]
        _countryInfo[78][:name] = "Belize"
        _countryInfo[78][:borders] = [77,79,81]
        _countryInfo[79][:name] = "Guatemala"
        _countryInfo[79][:borders] = [74,75,77,78,80,81]
        _countryInfo[80][:name] = "El Salvador"
        _countryInfo[80][:borders] = [79,81,82]
        _countryInfo[81][:name] = "Honduras"
        _countryInfo[81][:borders] = [78,79,80,82]
        _countryInfo[82][:name] = "Nicaragua"
        _countryInfo[82][:borders] = [80,81,83]
        _countryInfo[83][:name] = "Costa Rica"
        _countryInfo[83][:borders] = [82,84]
        _countryInfo[84][:name] = "Panama"
        _countryInfo[84][:borders] = [83]
        _countryInfo[85][:name] = "Jamaica"
        _countryInfo[85][:borders] = [86,88]
        _countryInfo[86][:name] = "Cuba"
        _countryInfo[86][:borders] = [30,77,85,87,88]
        _countryInfo[87][:name] = "Bahamas"
        _countryInfo[87][:borders] = [30,86,89]
        _countryInfo[88][:name] = "Haiti"
        _countryInfo[88][:borders] = [85,86,89]
        _countryInfo[89][:name] = "Dominican Republic"
        _countryInfo[89][:borders] = [87,88]

90.times do |n|
  Territory_border.create!(name:  _countryInfo[n][:name],
              borders: _countryInfo[n][:borders])
end
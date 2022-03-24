# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ski.destroy_all
SkiMaker.destroy_all

faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
salomon = SkiMaker.create!(company_name: "Salomon", years_active: 35, makes_snowboards: true)
_1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)
icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

#faction skis
agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: false)

#line skis
blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)

#salamon skis
spark = salomon.skis.create!(model: "QST Spark", ski_type: "Park", longest_offered_cm: 189, symmetrical: true)
blank = salomon.skis.create!(model: "QST Blank", ski_type: "All Mountain", longest_offered_cm: 202, symmetrical: false)

#1000 skis
park = _1000.skis.create!(model: "Park", ski_type: "Park/Pipe", longest_offered_cm: 199, symmetrical: true)
all_mtn = _1000.skis.create!(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)
powder = _1000.skis.create!(model: "PWDER", ski_type: "Powder/Backcountry", longest_offered_cm: 211, symmetrical: false)

#icelantic skis
nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

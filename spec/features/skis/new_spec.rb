require 'rails_helper'

RSpec.describe 'New Ski Maker' do

  describe 'as a visitor' do
    it 'has a link to create a new ski (child)' do
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
      tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
      chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)

      visit "/skis/"
      save_and_open_page
      expect(page).to have_content("Create Skis")

    end







  end
end

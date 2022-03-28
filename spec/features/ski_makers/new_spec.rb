require 'rails_helper'

RSpec.describe 'New Ski Maker' do

  describe 'as a visitor' do

    it 'can fill out a form with a new ski_makers attritbutes' do

      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/ski_makers/"
      click_on 'Add a Brand'

      expect(current_path).to eq("/ski_makers/new/")

      fill_in 'Company Name', with: 'Armada'
      fill_in 'Years Active', with: 17
      fill_in 'Do They Make Snowboards? (true or false)', with: false

      click_on 'Add Brand'

      expect(current_path).to eq("/ski_makers/")
      expect(page).to have_content("Armada")

    end
  end
end

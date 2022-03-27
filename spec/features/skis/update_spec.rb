require 'rails_helper'

RSpec.describe 'Update a Ski' do

  describe 'as a visitor on /ski/:id' do
    it 'has a link to create a update ski (child)' do
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/skis/#{nomad.id}"
      save_and_open_page
      expect(page).to have_content("Update Ski")
    end


  end
end

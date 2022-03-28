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
      # save_and_open_page
      expect(page).to have_content("Update Ski")
    end

    it 'can click the link and see a form on a new /edit page' do

      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/skis/#{nomad.id}"
      click_on "Update Ski"
      # save_and_open_page

      expect(current_path).to eq("/skis/#{nomad.id}/edit")
      expect(page).to have_content("Update This Ski")
      expect(page).to have_content("Model Name:")
      expect(page).to have_content("Ski Type:")
      expect(page).to have_content("Longest Offered Ski (cm):")
      expect(page).to have_content("Is This Ski 100% Symmetrical (true or false):")
      # expect(page).to have_content("Update Ski")

    end

    it 'can submit the form to update the ski and show the updated attributes on the skis/:id page' do

      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/skis/#{nomad.id}/edit"

      fill_in 'Model Name:', with: 'Pioneer'
      fill_in "ski[ski_type]", with: "All Mountain"
      fill_in 'Longest Offered Ski (cm):', with: 184
      fill_in 'Is This Ski 100% Symmetrical (true or false):', with: false
      click_on 'Update Ski'

      # save_and_open_page
      expect(current_path).to eq("/skis/#{nomad.id}")
      expect(page).to have_content("Pioneer")
      expect(page).to have_content("Ski Type: All Mountain")
      expect(page).to have_content("Largest Available Size: #{184}")
      expect(page).to have_content("Symmetrical? false" )

    end


  end
end

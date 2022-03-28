require 'rails_helper'

RSpec.describe 'New Ski' do

  describe 'as a visitor on ski_makers/:id/skis' do
    it 'has a link to create a new ski (child)' do
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/ski_makers/#{icelantic.id}/skis"
      # save_and_open_page
      expect(page).to have_content("Create Skis")
    end

    it 'can click the link to create new skis and is taken to a /new page' do

      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/ski_makers/#{icelantic.id}/skis"

      click_on "Create Skis"
      # save_and_open_page
      expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis/new/")
    end

    it 'can see the form to add a new pair of skis' do
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/ski_makers/#{icelantic.id}/skis/new"
      # save_and_open_page
      expect(page).to have_content("Model Name:")
      expect(page).to have_content("Ski Type:")
      expect(page).to have_content("Longest Offered Ski (cm):")
      expect(page).to have_content("Is This Ski 100% Symmetrical (true or false):")

    end

    it 'can fill in and submit/create new pair of skis' do

      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
      madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
      saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      visit "/ski_makers/#{icelantic.id}/skis/new"

      fill_in 'Model Name:', with: 'Pioneer'
      fill_in "ski[ski_type]", with: "All Mountain"
      fill_in 'Longest Offered Ski (cm):', with: 184
      fill_in 'Is This Ski 100% Symmetrical (true or false):', with: false
      click_on 'Create Skis'
      # save_and_open_page

      expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis/")
      expect(page).to have_content("Model Name: Pioneer")
      expect(page).to have_content("Ski Type: All Mountain")
      expect(page).to have_content("Longest Offered Size: #{184}" )

      expect("Model Name: Saba").to appear_before("Model Name: Pioneer")







    end







  end
end

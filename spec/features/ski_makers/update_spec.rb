require 'rails_helper'

RSpec.describe 'can update a ski_maker(parent)' do

  describe 'as a visitor' do

    it 'can click the button/link to update a ski_maker' do
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
      tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
      chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)

      visit "ski_makers/#{line.id}"
      click_on "Edit This Brand"

      expect(current_path).to eq("/ski_makers/#{line.id}/edit")

    end

    it 'can see the form to update/edit a ski_maker' do
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
      tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
      chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)

      visit "ski_makers/#{line.id}"
      click_on "Edit This Brand"

      expect(current_path).to eq("/ski_makers/#{line.id}/edit")
      expect(page).to have_content('Company Name:')
      expect(page).to have_content('Years Active:')
      expect(page).to have_content('Do They Make Snowboards? (true or false):')
    end

    it 'can submit the form to update/edit a ski_maker' do
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
      tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
      chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)
      visit "ski_makers/#{line.id}"
      click_on "Edit This Brand"

      fill_in 'Company Name:', with: 'Line Skis'
      fill_in 'Years Active:', with: 22
      fill_in 'Do They Make Snowboards? (true or false):', with: false

      click_on "Update"

      expect(current_path).to eq("/ski_makers/#{line.id}")
      expect(page).to have_content('Line Skis')
      expect(page).to have_content("Years Active: 22")
    end
  end

end

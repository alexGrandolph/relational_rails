require 'rails_helper'

RSpec.describe 'the /ski_makers/:id show page' do

  it 'shows a ski_makers/:id ' do
    ski_maker1 = SkiMaker.create(company_name: "4frnt", years_active: 13, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)

    visit "/ski_makers/#{ski_maker1.id}"
    # save_and_open_page
    expect(page).to have_content(ski_maker1.company_name)
    expect(page).to have_content(ski_maker1.years_active)
    expect(page).to have_content(ski_maker1.makes_snowboards)

  end

  it 'shows the number of skis associated with given ski_maker :id' do
    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
    prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
    ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: false)

    visit "/ski_makers/#{faction.id}"
    save_and_open_page

    expect(page).to have_content('Skis Available: 3')

  end

end

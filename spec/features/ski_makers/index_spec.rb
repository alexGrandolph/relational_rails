require 'rails_helper'

RSpec.describe 'the /ski_makers index page' do

  it '/ski_makers displays the name for each ski_makers' do
    ski_maker1 = SkiMaker.create(company_name: "4frnt", years_active: 13, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)
    ski_maker3 = SkiMaker.create(company_name: "Salomon", years_active: 35, makes_snowboards: true)
    ski_maker4 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    visit "/ski_makers/"
    # save_and_open_page
    expect(page).to have_content(ski_maker1.company_name)
    expect(page).to have_content(ski_maker2.company_name)
    expect(page).to have_content(ski_maker3.company_name)
    expect(page).to have_content(ski_maker4.company_name)
  end

  it 'displays ski_makers in order by created_at and shows created at on page' do
    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
    prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
    ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: false)

    visit "/ski_makers/"
    save_and_open_page

    expect(page).to have_content("Added to Site: #{faction.created_at}")

  end
end

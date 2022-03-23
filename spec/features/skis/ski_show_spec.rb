require 'rails_helper'

RSpec.describe 'the /skis/:id show page' do

  it 'shows a ski/:id' do
    ski_maker1 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    ski_1 = ski_maker1.skis.create(model: "Chronic", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    ski_2 = ski_maker2.skis.create(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/skis/#{ski_1.id}"
    save_and_open_page

    expect(page).to have_content(ski_1.model)
    expect(page).to have_content(ski_1.ski_type)
    expect(page).to have_content(ski_1.longest_offered_cm)
    expect(page).to have_content(ski_1.symmetrical)

  end

end
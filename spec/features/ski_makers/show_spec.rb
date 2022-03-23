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

end

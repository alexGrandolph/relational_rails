require 'rails_helper'

RSpec.describe 'the /ski_makers page' do

  it '/ski_makers displays the name for each ski_makers' do
    ski_maker1 = SkiMaker.create(company_name: "4frnt", years_active: 13, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)
    ski_maker3 = SkiMaker.create(company_name: "Salomon", years_active: 35, makes_snowboards: true)
    ski_maker3 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    visit "/ski_makers/"
    expect(page).to have_content(ski_maker1.company_name)
    expect(page).to have_content(ski_maker2.company_name)
    expect(page).to have_content(ski_maker3.company_name)
    expect(page).to have_content(ski_maker4.company_name)
  end
end

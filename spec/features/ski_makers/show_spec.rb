require 'rails_helper'

RSpec.describe 'the ski_makers shows page' do

  it 'displays new page for specific ski_maker :id' do
    ski_maker1 = SkiMaker.create(company_name: "4frnt", years_active: 15, makes_snowboards: false)
    visit "/ski_makers/#{ski_maker1.id}"

  end
end

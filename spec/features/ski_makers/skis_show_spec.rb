require 'rails_helper'

RSpec.describe 'the /ski_makes/:id/skis' do

  it 'shows all the skis associated with a makers :id' do
    ski_maker1 = SkiMaker.create(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    ski_1 = ski_maker1.skis.create(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    ski_2 = ski_maker1.skis.create(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    ski_3 = ski_maker1.skis.create(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    ski_4 = ski_maker1.skis.create(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)
    ski_5 = ski_maker2.skis.create(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{ski_maker1.id}/skis"
    # save_and_open_page

    expect(page).to have_content(ski_1.model)
    expect(page).to have_content(ski_1.ski_type)
    expect(page).to have_content(ski_1.longest_offered_cm)
    expect(page).to have_content(ski_1.symmetrical)
    expect(page).to have_content(ski_2.model)
    expect(page).to have_content(ski_2.ski_type)
    expect(page).to have_content(ski_2.longest_offered_cm)
    expect(page).to have_content(ski_2.symmetrical)
    expect(page).to have_content(ski_3.model)
    expect(page).to have_content(ski_3.ski_type)
    expect(page).to have_content(ski_3.longest_offered_cm)
    expect(page).to have_content(ski_3.symmetrical)
    expect(page).to have_content(ski_4.model)
    expect(page).to have_content(ski_4.ski_type)
    expect(page).to have_content(ski_4.longest_offered_cm)
    expect(page).to have_content(ski_4.symmetrical)

  end

  it 'has clickable link to skis#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"
    # save_and_open_page
    click_on 'See All Skis!'

    expect(current_path).to eq("/skis/")
  end

  it 'has clickable link to ski_maker#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"
    # save_and_open_page
    click_on 'See All Brands!'

    expect(current_path).to eq("/ski_makers/")
  end

end

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

  it 'has a link to sort skis by alphabetical order (by model)' do

    Ski.destroy_all
    SkiMaker.destroy_all

    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"

    click_on 'Sort Alphabetically'
    expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis")

    # save_and_open_page
    expect("Model Name: #{madien.model}").to appear_before("Model Name: #{nomad.model}")
    expect("Model Name: #{saba.model}").to appear_before("Model Name: #{shaman.model}")
  end

  it 'has a link to edit each ski, takes to that skis edit page' do
    Ski.destroy_all
    SkiMaker.destroy_all

    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"

    click_on "Edit #{nomad.model}"

    expect(current_path).to eq("/skis/#{nomad.id}/edit")
  end

  it 'has a form to that allows user to see all skis over 190 cm' do
    Ski.destroy_all
    SkiMaker.destroy_all

    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"

    fill_in "Show Skis Available Above This Length:", with: 190

    click_on 'Only return records with a longest offered cm over 190'

    expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis")

    expect(page).to_not have_content("Model Name: #{maden.model}")
    expect(page).to_not have_content("Longest Offered Size: #{maden.longest_offered_cm}")

    expect(page).to have_content("Model Name: #{nomad.model}")
    expect(page).to have_content("Longest Offered Size: #{nomad.longest_offered_cm}")
    expect(page).to have_content("Model Name: #{shaman.model}")
    expect(page).to have_content("Longest Offered Size: #{shaman.longest_offered_cm}")
    expect(page).to have_content("Model Name: #{saba.model}")
    expect(page).to have_content("Longest Offered Size: #{saba.longest_offered_cm}")
  end
# bundle exec rspec spec/features/ski_makers/skis/index_spec.rb:65

end

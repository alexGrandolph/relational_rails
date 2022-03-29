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
    # save_and_open_page

    expect(page).to have_content('Skis Available: 3')
  end

  it 'has clickable link to skis#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}"
    click_on 'See All Skis!'

    expect(current_path).to eq("/skis/")
  end

  it 'has clickable link to ski_makers#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}"
    click_on 'See All Brands!'

    expect(current_path).to eq("/ski_makers/")
  end

  it 'has clickable link to ski_makers#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}"
    click_on 'See These Skis!'

    expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis")
  end

  it 'has a clickable link to destroy the #show pages ski maker' do
    Ski.destroy_all
    SkiMaker.destroy_all

    salomon = SkiMaker.create!(company_name: "Salomon", years_active: 35, makes_snowboards: true)
    spark = salomon.skis.create!(model: "QST Spark", ski_type: "Park", longest_offered_cm: 189, symmetrical: true)
    blank = salomon.skis.create!(model: "QST Blank", ski_type: "All Mountain", longest_offered_cm: 202, symmetrical: false)

    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
    prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
    ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: false)

    visit "/ski_makers/#{salomon.id}"
    click_on 'DELETE'

    expect(current_path).to eq("/ski_makers")
    save_and_open_page
    expect(page).to_not have_content("#{salomon.company_name}")
    # expect(page).to_not have_content("#{salomon.created_at}")

    expect(page).to have_content("#{faction.company_name}")
    expect(page).to have_content("#{faction.created_at}")

  end


end

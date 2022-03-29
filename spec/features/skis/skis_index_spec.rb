require 'rails_helper'

RSpec.describe 'the /skis index page' do

  it 'displays all skis with true in symmetrical column' do
    Ski.destroy_all
    SkiMaker.destroy_all

    _1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    park = _1000.skis.create!(model: "Park", ski_type: "Park/Pipe", longest_offered_cm: 199, symmetrical: true)
    all_mtn = _1000.skis.create!(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)

    visit "/skis/"

    expect(page).to have_content("Model Name: #{park.model}")
    expect(page).to have_content("Ski Type: #{park.ski_type}")
    expect(page).to have_content("Longest Size Available: #{park.longest_offered_cm}")
    expect(page).to have_content("Symmetrical?: #{park.symmetrical}")
    expect(page).to have_content("Model Name: #{nomad.model}")
    expect(page).to have_content("Ski Type: #{nomad.ski_type}")
    expect(page).to have_content("Longest Size Available: #{nomad.longest_offered_cm}")
    expect(page).to have_content("Symmetrical?: #{nomad.symmetrical}")

    expect(page).to_not have_content("Model Name: #{all_mtn.model}")
    expect(page).to_not have_content("Model Name: #{shaman.model}")
  end

  it 'has clickable link to skis#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/skis/"
    click_on 'See All Skis!'
    # save_and_open_page
    expect(current_path).to eq("/skis/")
  end

  it 'has clickable link to ski_maker#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/skis/"
    click_on 'See All Brands!'
    # save_and_open_page
    expect(current_path).to eq("/ski_makers/")
  end

  it 'has a link to edit a ski next to each ski, takes to that skis edit page' do
    Ski.destroy_all
    SkiMaker.destroy_all

    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
    prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
    ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: true)

    _1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: true)
    park = _1000.skis.create!(model: "Park", ski_type: "Park/Pipe", longest_offered_cm: 199, symmetrical: true)
    all_mtn = _1000.skis.create!(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: true)
    powder = _1000.skis.create!(model: "PWDER", ski_type: "Powder/Backcountry", longest_offered_cm: 211, symmetrical: true)

    visit "/skis/"
    # save_and_open_page

    click_on "Edit #{agent.model}"
    expect(current_path).to eq("/skis/#{agent.id}/edit")
  end

  it 'has a link to delete ski next to each ski, clicking refreshes page with ski destroyed' do

    Ski.destroy_all
    SkiMaker.destroy_all

    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
    ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: true)

    _1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: true)
    park = _1000.skis.create!(model: "Park", ski_type: "Park/Pipe", longest_offered_cm: 199, symmetrical: true)
    all_mtn = _1000.skis.create!(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: true)

    visit "/skis"

    within "#ski-#{park.model}" do
      click_on "DELETE"
    end

    expect(current_path).to eq("/skis")
    expect(page).to_not have_content("Model Name: Park}")
    expect(page).to have_content("Model Name: #{agent.model}")
    expect(page).to have_content("Model Name: #{ct.model}")
    expect(page).to have_content("Model Name: #{all_mtn.model}")
  end


end

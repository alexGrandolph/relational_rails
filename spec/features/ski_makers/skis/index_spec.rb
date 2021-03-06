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
    click_on 'See All Ski Makers!'

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

  it 'has a form to that allows user to see all skis over given cm' do
    Ski.destroy_all
    SkiMaker.destroy_all

    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    maiden = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/#{icelantic.id}/skis"

    fill_in "Show Skis Available Above This Length:", with: 190

    click_on 'Only Return Skis Over This Length'

    expect(current_path).to eq("/ski_makers/#{icelantic.id}/skis")
    # save_and_open_page
    expect(page).to_not have_content("Model Name: #{maiden.model}")
    expect(page).to_not have_content("Longest Offered Size: #{maiden.longest_offered_cm}")

    expect(page).to have_content("Model Name: #{nomad.model}")
    expect(page).to have_content("Longest Offered Size: #{nomad.longest_offered_cm}")
    expect(page).to have_content("Model Name: #{shaman.model}")
    expect(page).to have_content("Longest Offered Size: #{shaman.longest_offered_cm}")
    expect(page).to have_content("Model Name: #{saba.model}")
    expect(page).to have_content("Longest Offered Size: #{saba.longest_offered_cm}")
  end


  it 'has a link to delete ski next to each ski, clicking refreshes page with ski destroyed' do
    Ski.destroy_all
    SkiMaker.destroy_all

    salomon = SkiMaker.create!(company_name: "Salomon", years_active: 35, makes_snowboards: true)

    spark = salomon.skis.create!(model: "QST Spark", ski_type: "Park", longest_offered_cm: 189, symmetrical: true)
    blank = salomon.skis.create!(model: "QST Blank", ski_type: "All Mountain", longest_offered_cm: 202, symmetrical: true)
    dumont = salomon.skis.create!(model: "Dumont", ski_type: "Park", longest_offered_cm: 177, symmetrical: true)

    visit "/ski_makers/#{salomon.id}/skis"

    within "#ski-#{dumont.model}" do
      click_on "DELETE"
    end

    expect(current_path).to eq("/skis")
    expect(page).to_not have_content("Model Name: #{dumont.model}")
    expect(page).to have_content("Model Name: #{spark.model}")
    expect(page).to have_content("Model Name: #{blank.model}")
  end

end

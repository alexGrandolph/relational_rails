require 'rails_helper'

RSpec.describe 'the /skis/:id show page' do

  it 'shows a ski/:id' do
    ski_maker1 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    ski_1 = ski_maker1.skis.create(model: "Chronic", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    ski_2 = ski_maker2.skis.create(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/skis/#{ski_1.id}"
    # save_and_open_page

    expect(page).to have_content(ski_1.model)
    expect(page).to have_content(ski_1.ski_type)
    expect(page).to have_content(ski_1.longest_offered_cm)
    expect(page).to have_content(ski_1.symmetrical)

  end

  it 'has clickable link to skis#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/skis/#{nomad.id}"
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

    visit "/skis/#{nomad.id}"
    click_on 'See All Brands!'
    # save_and_open_page
    expect(current_path).to eq("/ski_makers/")
  end

  it 'has clickable link to destroy current ski' do
    Ski.destroy_all
    SkiMaker.destroy_all

    salomon = SkiMaker.create!(company_name: "Salomon", years_active: 35, makes_snowboards: true)
    spark = salomon.skis.create!(model: "QST Spark", ski_type: "Park", longest_offered_cm: 189, symmetrical: true)
    blank = salomon.skis.create!(model: "QST Blank", ski_type: "All Mountain", longest_offered_cm: 202, symmetrical: false)

    visit "/skis/#{blank.id}"
    click_on 'DELETE'

    expect(current_path).to eq("/skis")
    # save_and_open_page

    expect(page).to_not have_content("Model Name: #{blank.model}")
    expect(page).to_not have_content("Longest Size Available: #{blank.longest_offered_cm}")

    expect(page).to have_content("Model Name: #{spark.model}")
    expect(page).to have_content("Longest Size Available: #{spark.longest_offered_cm}")
  end

end

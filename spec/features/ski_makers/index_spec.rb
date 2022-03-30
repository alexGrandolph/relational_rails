require 'rails_helper'

RSpec.describe 'the /ski_makers index page' do

  it '/ski_makers displays the name for each ski_makers' do
    ski_maker1 = SkiMaker.create(company_name: "4frnt", years_active: 13, makes_snowboards: false)
    ski_maker2 = SkiMaker.create(company_name: "Line", years_active: 15, makes_snowboards: false)
    ski_maker3 = SkiMaker.create(company_name: "Salomon", years_active: 35, makes_snowboards: true)
    ski_maker4 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    visit "/ski_makers/"
    expect(page).to have_content(ski_maker1.company_name)
    expect(page).to have_content(ski_maker2.company_name)
    expect(page).to have_content(ski_maker3.company_name)
    expect(page).to have_content(ski_maker4.company_name)
  end

  it 'displays ski_makers in order by created_at and shows created at on page' do
    faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
    thousand = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    visit "/ski_makers/"

    expect(page).to have_content("Added to Site: #{faction.created_at}")
    expect(page).to have_content("Added to Site: #{line.created_at}")
    expect("#{thousand.company_name}").to appear_before("#{line.company_name}")
    expect("#{icelantic.company_name}").to appear_before("#{faction.company_name}")
  end

  it 'has clickable link to skis#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/"
    click_on 'See All Skis!'

    expect(current_path).to eq("/skis/")
  end

  it 'has clickable link to ski_makers#index' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
    shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
    madien = icelantic.skis.create!(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
    saba = icelantic.skis.create!(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

    visit "/ski_makers/"
    click_on 'See All Ski Makers!'

    expect(current_path).to eq("/ski_makers/")
  end


  it 'has clickable link to ski_makers#new' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
    line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
    thousand = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

    visit "/ski_makers/"
    click_on 'Add a Ski Maker'

    expect(current_path).to eq("/ski_makers/new/")
  end

  it 'can fill out a form with a new ski_makers attritbutes' do
    icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

    visit "/ski_makers/"
    click_on 'Add a Ski Maker'

    expect(current_path).to eq("/ski_makers/new/")

    fill_in 'Company Name', with: 'Armada'
    fill_in 'Years Active', with: 17
    fill_in 'Do They Make Snowboards?', with: false
    click_on 'Add Ski Maker'

    expect(current_path).to eq("/ski_makers/")

    within "#maker-#{"Armada"}" do
    expect(page).to have_content("Armada")
    expect(page).to have_content("Added to Site:")
    end
    expect("Armada").to appear_before("#{icelantic.company_name}")

  end

    it 'has an edit button for every parent which goes to parent edit page' do
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      visit "/ski_makers/"

      click_on 'Edit'
      expect(current_path).to eq("/ski_makers/#{line.id}/edit")
    end

    it 'has a delete link to delete each ski maker' do
      Ski.destroy_all
      SkiMaker.destroy_all
      faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)
      _1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

      visit "/ski_makers/"

      within "#maker-#{faction.company_name}" do
        click_on "DELETE"

      end
      # save_and_open_page
      expect(current_path).to eq("/ski_makers")
      expect(page).to_not have_content("#{faction.company_name}")
      expect(page).to have_content("#{line.company_name}")
      expect(page).to have_content("#{_1000.company_name}")

    end

    it 'has a link to see each makers respective skis page' do
      Ski.destroy_all
      SkiMaker.destroy_all
      faction = SkiMaker.create!(company_name: "Faction", years_active: 13, makes_snowboards: false)
      agent = faction.skis.create!(model: "Agent", ski_type: "Park", longest_offered_cm: 195, symmetrical: true)
      prodigy = faction.skis.create!(model: "Prodigy", ski_type: "Park", longest_offered_cm: 198, symmetrical: true)
      ct = faction.skis.create!(model: "CT 2.0", ski_type: "Backcountry", longest_offered_cm: 213, symmetrical: false)
      line = SkiMaker.create!(company_name: "Line", years_active: 15, makes_snowboards: false)

      blade = line.skis.create!(model: "BLADE", ski_type: "Powder", longest_offered_cm: 215, symmetrical: false)
      tom = line.skis.create!(model: "Tom Wallisch Pro", ski_type: "Park", longest_offered_cm: 205, symmetrical: true)
      chronic = line.skis.create!(model: "Chronic", ski_type: "Park", longest_offered_cm: 204, symmetrical: true)

      visit "/ski_makers/"
      within "#maker-#{faction.company_name}" do
        click_on "See Their Skis"
      end
    
      expect(current_path).to eq("/ski_makers/#{faction.id}/skis")
      expect(page).to have_content("#{agent.model}")
      expect(page).to have_content("#{ct.model}")
      expect(page).to_not have_content("#{blade.model}")

    end


end

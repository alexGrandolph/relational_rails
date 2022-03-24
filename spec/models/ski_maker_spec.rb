require 'rails_helper'

RSpec.describe SkiMaker, type: :model do
  describe 'instane methods' do
    describe '#children' do
      it 'returns all the skis associated with a given parent' do
        ski_maker1 = SkiMaker.create(company_name: "Icelantic", years_active: 15, makes_snowboards: false)
        ski_maker2 = SkiMaker.create(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)

        ski_1 = ski_maker1.skis.create(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
        ski_2 = ski_maker1.skis.create(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)
        ski_3 = ski_maker1.skis.create(model: "Madien", ski_type: "Park", longest_offered_cm: 178, symmetrical: true)
        ski_4 = ski_maker1.skis.create(model: "Saba", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)
        ski_5 = ski_maker2.skis.create(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

        expect(ski_maker1.children).to be_a(Array)
        expect(ski_maker1.children).to eq([ski_1, ski_2, ski_3, ski_4])


      end
    end
  end
end

require 'rails_helper'

RSpec.describe Ski, type: :model do

  describe 'validations' do
    it { should validate_presence_of :model }
    it { should validate_presence_of :ski_type }
    it { should validate_presence_of :longest_offered_cm }
    it { should allow_values(true, false).for(:symmetrical)}
  end

  describe 'relationships' do
    it { should belong_to :ski_maker }
  end

  describe 'methods' do

    it 'returns all records with true in symmetrical column (boolean)' do
      Ski.destroy_all
      SkiMaker.destroy_all

      _1000 = SkiMaker.create!(company_name: "1000 Skis", years_active: 2, makes_snowboards: false)
      icelantic = SkiMaker.create!(company_name: "Icelantic", years_active: 15, makes_snowboards: false)

      park = _1000.skis.create!(model: "Park", ski_type: "Park/Pipe", longest_offered_cm: 199, symmetrical: true)
      all_mtn = _1000.skis.create!(model: "All MTN", ski_type: "All Mountain", longest_offered_cm: 201, symmetrical: false)

      nomad = icelantic.skis.create!(model: "Nomad", ski_type: "Park", longest_offered_cm: 191, symmetrical: true)
      shaman = icelantic.skis.create!(model: "Shaman", ski_type: "Powder", longest_offered_cm: 209, symmetrical: false)

      expect(Ski.all_true).to eq([park, nomad])

    end


  end
end

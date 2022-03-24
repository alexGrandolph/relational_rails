require 'rails_helper'

RSpec.describe Ski, type: :model do
  describe 'validations' do
    it { should validate_presence_of :model }
    it { should validate_presence_of :ski_type }
    it { should validate_presence_of :longest_offered_cm }
    it { should validate_presence_of :symmetrical }
  end

  describe 'relationships' do
    it { should belong_to :ski_maker }
  end
end 

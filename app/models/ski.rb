class Ski < ApplicationRecord
  belongs_to :ski_maker

  validates_presence_of :model
  validates_presence_of :ski_type
  validates_presence_of :longest_offered_cm
  validates :symmetrical, inclusion: [true, false]

  def self.all_true
    Ski.where(symmetrical: true)
  end

end

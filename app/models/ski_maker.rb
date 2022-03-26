class SkiMaker < ApplicationRecord
  validates_presence_of :company_name
  validates_presence_of :years_active
  validates :makes_snowboards, inclusion: [true, false]

  has_many :skis

  def self.most_recent
    order('created_at DESC')
  end

  def self.number_of_skis
    self.skis.count
  end

end

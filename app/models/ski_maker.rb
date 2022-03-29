class SkiMaker < ApplicationRecord
  validates_presence_of :company_name
  validates_presence_of :years_active
  validates :makes_snowboards, inclusion: [true, false]

  has_many :skis,
           dependent: :destroy

  def self.most_recent
    order('created_at DESC')
  end

  def sort_alpha
    skis = self.skis
    sorted = skis.order(:model)
    sorted
    # require "pry"; binding.pry
  end

end

   # Ski.order(:model)

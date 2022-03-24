class SkiMaker < ApplicationRecord
  validates_presence_of :company_name
  validates_presence_of :years_active
  validates_presence_of :makes_snowboards

  has_many :skis

  def children
    makers = SkiMaker.all
    skis = Ski.all
    array = []
    makers.each do |maker|
      skis.each do |ski|
        if maker == ski.ski_maker_id
          array << ski
        end
      end
    end
    # require "pry"; binding.pry
  end
end

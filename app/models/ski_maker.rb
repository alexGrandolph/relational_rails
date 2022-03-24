class SkiMaker < ApplicationRecord
  has_many :skis

  def children
    makers = SkiMaker.ids
    skis = Ski.all
    array = []
    other = []
    skis.each do |ski|
      makers.each do |maker|
        if maker == ski.ski_maker_id
          array << ski
        else
          other << ski
        end
      end
    end
    require "pry"; binding.pry
    array

  end
end

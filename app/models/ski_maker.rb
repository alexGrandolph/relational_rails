class SkiMaker < ApplicationRecord
  validates_presence_of :company_name
  validates_presence_of :years_active
  validates :makes_snowboards, inclusion: [true, false]

  has_many :skis

end


# rails g model Ski ski_maker:references model:string ski_type:string

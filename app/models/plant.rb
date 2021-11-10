class Plant < ApplicationRecord

  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.less_than_hundred
    where('days_to_harvest < 100')

  end
end

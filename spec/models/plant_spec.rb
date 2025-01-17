require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many(:plot_plants) }
    it {should have_many(:plots).through(:plot_plants)}
  end

  it 'results are plants that take less than 100 days to harvest' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    sweet_peas = Plant.create!(name: "sweet peas", description: "sweet and delicious", days_to_harvest: 40)
    peppers = Plant.create!(name: "peppers", description: "multi-colored", days_to_harvest: 60)
    carrots = Plant.create!(name: "carrots", description: "orange", days_to_harvest: 50)

    expect(Plant.less_than_hundred).to eq([sweet_peas, peppers, carrots])

  end
end

# When I visit an garden's show page
# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest

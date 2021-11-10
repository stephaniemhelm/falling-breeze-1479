require 'rails_helper'

RSpec.describe Garden do
  it 'shows all plot numbers and the names of that plots plants' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    sweet_peas = Plant.create!(name: "sweet peas", description: "sweet and delicious", days_to_harvest: 40)
    peppers = Plant.create!(name: "peppers", description: "multi-colored", days_to_harvest: 60)
    carrots = Plant.create!(name: "carrots", description: "orange", days_to_harvest: 50)

    plot_plant1 = PlotPlant.create!(plot_id: plot1.id, plant_id: sweet_peas.id)
    plot_plant2 = PlotPlant.create!(plot_id: plot1.id, plant_id: peppers.id)
    plot_plant3 = PlotPlant.create!(plot_id: plot1.id, plant_id: carrots.id)

    visit "/gardens/#{turing_garden.id}"

    expect(page).to have_content(plot1.number)
    
  end
end

# When I visit an garden's show page
# Then I see a list of plants that are included in that garden's plots
# And I see that this list is unique (no duplicate plants)
# And I see that this list only includes plants that take less than 100 days to harvest


# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants

require 'rails_helper'

RSpec.describe Plot do
  it 'shows all plot numbers and the names of that plots plants' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    sweet_peas = Plant.create!(name: "sweet peas", description: "sweet and delicious", days_to_harvest: 40)
    peppers = Plant.create!(name: "peppers", description: "multi-colored", days_to_harvest: 60)
    carrots = Plant.create!(name: "carrots", description: "orange", days_to_harvest: 50)

    plot_plant1 = PlotPlant.create!(plot_id: plot1.id, plant_id: sweet_peas.id)
    plot_plant2 = PlotPlant.create!(plot_id: plot1.id, plant_id: peppers.id)
    plot_plant3 = PlotPlant.create!(plot_id: plot1.id, plant_id: carrots.id)

    visit '/plots'

    expect(page).to have_content(plot1.number)
    expect(page).to have_content(sweet_peas.name)
    expect(page).to have_content(peppers.name)
    expect(page).to have_content(carrots.name)



  end

end

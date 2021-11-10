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

  it 'can delete a plant from a plot' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    sweet_peas = Plant.create!(name: "sweet peas", description: "sweet and delicious", days_to_harvest: 40)
    peppers = Plant.create!(name: "peppers", description: "multi-colored", days_to_harvest: 60)
    carrots = Plant.create!(name: "carrots", description: "orange", days_to_harvest: 50)

    plot_plant1 = PlotPlant.create!(plot_id: plot1.id, plant_id: sweet_peas.id)
    plot_plant2 = PlotPlant.create!(plot_id: plot1.id, plant_id: peppers.id)
    plot_plant3 = PlotPlant.create!(plot_id: plot1.id, plant_id: carrots.id)

    visit '/plots'

      within("#plant-#{sweet_peas.id}") do
        expect(page).to have_content(sweet_peas.name)
        click_link 'Remove Plant'
      end
      expect(page).to_not have_content(sweet_peas.name)
  end

end

# When I visit a plot's index page
# Next to each plant's name
# I see a link to remove that plant from that plot
# When I click on that link
# I'm returned to the plots index page
# And I no longer see that plant listed under that plot
# (Note: you should not destroy the plant record entirely)

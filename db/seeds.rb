turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
plot2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
plot3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
plot4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

sweet_peas = Plant.create!(name: "sweet peas", description: "sweet and delicious", days_to_harvest: 40)
peppers = Plant.create!(name: "peppers", description: "multi-colored", days_to_harvest: 60)
carrots = Plant.create!(name: "carrots", description: "orange", days_to_harvest: 50)
zucchini = Plant.create!(name: "zucchini", description: "large and green", days_to_harvest: 75)
potatoes = Plant.create!(name: "potatoes", description: "idaho", days_to_harvest: 85)


plot_plant1 = PlotPlant.create!(plot_id: plot1.id, plant_id: sweet_peas.id)
plot_plant2 = PlotPlant.create!(plot_id: plot1.id, plant_id: peppers.id)
plot_plant3 = PlotPlant.create!(plot_id: plot1.id, plant_id: carrots.id)
plot_plant4 = PlotPlant.create!(plot_id: plot2.id, plant_id: sweet_peas.id)
plot_plant5 = PlotPlant.create!(plot_id: plot2.id, plant_id: potatoes.id)
plot_plant6 = PlotPlant.create!(plot_id: plot3.id, plant_id: zucchini.id)

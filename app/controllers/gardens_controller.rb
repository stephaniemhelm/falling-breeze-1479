class GardensController < ApplicationController

  # def index
  #   @gardens = Garden.all
  #   @garden_plants = @garden.plants
  # end

  def show
    @garden = Garden.find(params[:id])
    @garden_plots = @garden.plots
    require "pry"; binding.pry
  end
end

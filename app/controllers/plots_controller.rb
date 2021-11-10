class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def show
    require "pry"; binding.pry
    @plot = Plot.find(params[:id])
    @plots_plants = @plot.plants
  end
end

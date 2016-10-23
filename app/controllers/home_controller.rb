class HomeController < ApplicationController
  before_action :set_commodities

  def index
  end

  private

  def set_commodities
    @commodities = Commodity.active_commodities
  end
end

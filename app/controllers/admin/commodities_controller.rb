class Admin::CommoditiesController < ApplicationController
  before_action :set_commodity, only: [:show, :edit, :update, :destroy]

  def index
    @commodities = Commodity.all
  end

  def show
  end

  def new
    @commodity = Commodity.new
  end

  def edit
  end

  def create
    @commodity = Commodity.new(commodity_params)

    if @commodity.save
      redirect_to admin_commodity_path(@commodity), notice: 'Commodity was successfully created.'
    else
      render :new
    end
  end

  def update
    if @commodity.update(commodity_params)
      redirect_to admin_commodity_path(@commodity), notice: 'Commodity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @commodity.destroy
    redirect_to admin_commodities_url, notice: 'Commodity was successfully destroyed.'
  end

  private
  def set_commodity
    @commodity = Commodity.find(params[:id])
  end

  def commodity_params
    params.require(:commodity).permit(:name, :description, :price, :position, :view_enabled)
  end
end

class PlantsController < ApplicationController

  def index
    render json: Plant.all, except: [:created_at, :updated_at]
  end

  def show
    plant =Plant.find(params[:id])
    render json: plant, except: [:created_at, :updated_at]
  end

  def create
    plant = Plant.create(plant_params)
   if plant
    render json: plant, status: :created
   else
    render json: {error: "Plant can't be created"}
   end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end


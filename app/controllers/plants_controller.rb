class PlantsController < ApplicationController
    # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
        if plant.save
            redirect_to plants_url
        else
            render json: { error: "unsuccessfull" }, status: :not_found
        end
  end

  def  plant_params
        params.require(:plant).permit(:name, :image, :price)
    end
end

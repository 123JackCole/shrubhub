class PlantsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show, :new, :create]

    def index
        @plants = Plant.all
    end

    def show
        @plant = Plant.find(params[:id])
    end

    def new
        @plant = Plant.new
    end

    def create
        @plant = Plant.create(plant_params.merge(user: current_user))
        if @plant.valid?
            redirect_to @plant
        else
            flash[:notice] = @plant.errors.full_messages
            render :new
        end
    end

    def edit
        @plant = Plant.find(params[:id])
    end

    def update
        @plant = Plant.find(params[:id])
        if @plant.valid?
            @plant.update(plant_params)
            redirect_to @plant
        else
            flash[:notice] = plant.errors.full_messages
            render :edit
        end
    end

    def destroy
        @plant = Plant.find_by(user_id:session[:user_id])
        @plant.destroy
        redirect_to :root
    end

    private

    def plant_params
        params.require(:plant).permit(:name, :description, :image, :price, :light_instructions, :water_instructions, :other_instructions)
    end

end

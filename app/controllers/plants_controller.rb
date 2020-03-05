class PlantsController < ApplicationController

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
        @plant = Plant.find(params[:id])
        @plant.destroy
    end

    def add_plant_to_cart(plant_id)
        @item = Item.find(params[:id])
        current_cart << @item.id
    end

    def get_plants_from_cart
        @cart_items = Plant.find(cart.keys)
        @total = 0
        @cart_items.each do |plant|
                price = cart[plant.id.to_s] * plant.price
                @total += price
        end
    end

    private

    def plant_params
        params.require(:plant).permit(:name, :description, :image, :price, :light_instructions, :water_instructions, :other_instructions)
    end

end

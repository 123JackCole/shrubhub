class CartsController < ApplicationController

    def index
        
    end

    def show
        
    end

    def update
        add_plant_to_cart(params[:plants_id])
    end 

    def delete
        session.delete(:cart)
    end 
end
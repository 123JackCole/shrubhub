class CartsController < ApplicationController

    def show
        @cart = current_cart
    end

    def update
        add_plant_to_cart(params[:plant_id])
    end

    def delete
        session.delete(:cart)
    end
    
end

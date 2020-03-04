class CartsController < ApplicationController
    before_action :require_login

    def update
        add_plant_to_cart(params[:plants_id])
    end

    def delete
        session.delete(:cart)
    end

end

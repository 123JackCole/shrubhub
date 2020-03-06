class OrdersController < ApplicationController

    def create
        @order = Order.create(cart_id: current_cart.id, plant_id: session[:plant_id])
        if @order.valid?
            redirect_to cart_path(current_user)
        else
            flash[:notice] = @order.errors.full_messages
            render :new
        end
    end

    def destroy
        @order = Order.find_by(cart_id:current_cart)
        @order.delete
        redirect_to cart_path(current_user)
    end

end

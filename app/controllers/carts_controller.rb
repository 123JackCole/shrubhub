class CartsController < ApplicationController

    def show
        @cart = Cart.find_by(user_id:params[:id])
    end

    def add
        @order = Order.create(cart_id: current_cart.id, plant_id: session[:plant_id])
        redirect_to cart_path(current_cart)
    end

    # def new
    #     @cart = Cart.new
    # end

    # def create
    #     @cart = Cart.create(cart_params.merge(user: current_user))
    #     if @cart.valid?
    #         redirect_to @cart
    #     else
    #         flash[:notice] = @cart.errors.full_messages
    #         render :new
    #     end
    # end

    # def edit
    #     @cart = Cart.find(params[:id])
    # end

    # def add_plant_to_cart(plant_id)
    #     @cart = Cart.find(params[:id])
    #     @order = Order.create(cart_id: @cart.id, plant_id: session[:plant_id])
    #     if @cart.valid?
    #         @cart.update(cart_params)
    #         redirect_to @cart
    #     else
    #         flash[:notice] = cart.errors.full_messages
    #         render :edit
    #     end
    # end

    # def delete
    #     @plant = Plant.find_by(user_id:session[:user_id])
    #     @plant.destroy
    #     redirect_to :root
    # end

end

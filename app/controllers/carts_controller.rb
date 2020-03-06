class CartsController < ApplicationController

    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find(params[:id])
    end

    def new
        @cart = Cart.new
    end

    def create
        @cart = Cart.create(cart_params.merge(user: current_user))
        if @cart.valid?
            redirect_to @cart
        else
            flash[:notice] = @cart.errors.full_messages
            render :new
        end
    end

    def edit
        @cart = Cart.find(params[:id])
    end

    def update
        @cart = Cart.find(params[:id])
        if @cart.valid?
            @cart.update(cart_params)
            redirect_to @cart
        else
            flash[:notice] = cart.errors.full_messages
            render :edit
        end
    end

    def delete
        @plant = Plant.find_by(user_id:session[:user_id])
        @plant.destroy
        redirect_to :root
    end

end

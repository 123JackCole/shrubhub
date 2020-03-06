class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :login_user, :current_user, :current_cart, :logged_in?

    def login_user(user)
        session[:user_id] = user.id
    end
 
    def current_user
        User.find_by(id:session[:user_id])
    end

    def current_cart
        Cart.find_by(user_id:session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        unless logged_in?
            flash[:notice] = "You must be logged in to see this page"
            redirect_to login_path
        end
    end

    # def add_plant_to_cart(plant_id)
    #     if current_cart.include?(plant_id)
    #         flash[:notice] = "That item is already in your cart"
    #         redirect_to :root
    #     else
    #         current_cart << plant_id
    #         redirect_to carts_path
    #     end
    # end

    # def remove_plant_from_cart(plant_id)
    #     if cart[plant_id]
    #         current_cart.delete(current_cart.find(plant_id).id)
    #         redirect_to carts_path
    #     else
    #         flash[:notice] = "That item isn't in your cart"
    #         redirect_to carts_path
    #     end
    # end

    # def get_plants_from_cart
    #     @cart_plants = Plant.find(cart.keys)
    #     @total = 0
    #     @cart_plants.each do |plant|
    #         price = cart[plant.id.to_s] * plant.price
    #         @total += price
    #     end
    # end

end

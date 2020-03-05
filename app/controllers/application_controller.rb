class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_cart, :logged_in?, :current_user

    def login_user(user)
        session[:user_id] = user.id
    end
 
    def current_user
        User.find_by(id:session[:user_id])
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

    def current_cart
        session[:cart] ||= {}
    end

end

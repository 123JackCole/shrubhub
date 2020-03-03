class ApplicationController < ActionController::Base
    helper_method :current_cart
 
    def current_user
        session[:name]
    end

    def current_cart
        session[:cart] ||= []
    end

    private

    def require_login
        redirect_to controller: 'sessions', action: 'new' unless current_user
    end

end

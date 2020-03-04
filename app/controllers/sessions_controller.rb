class SessionsController < ApplicationController
    skip_before_action :authorized, only[:new, :create]

    def new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            login_user(@user)
            redirect_to @user
        else
            flash[:notice] = @user.errors.full_messages
            redirect_to login_path
        end
    end

    def destroy
        @user = User.find(session[:user_id])
        @user.destroy
        redirect_to login_path
    end

end

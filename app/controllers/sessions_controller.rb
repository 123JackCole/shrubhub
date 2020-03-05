class SessionsController < ApplicationController

    def new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            login_user(@user)
            redirect_to @user
        else
            # flash[:notice] = "User does not exist"
            # flash[:notice] = @user.errors.full_messages
            redirect_to login_path
        end
    end

    def destroy
        @user = User.find(session[:user_id])
        @user.destroy
        redirect_to login_path
    end

end

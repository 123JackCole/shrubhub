class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            login_user(@user)
            redirect_to @user
        else
            flash[:notice] = "Username / Password combination does not exist"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = "Log Out Sucessful"
        redirect_to login_path
    end

end

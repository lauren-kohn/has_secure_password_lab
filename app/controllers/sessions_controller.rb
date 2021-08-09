class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        if !user
            redirect_to '/login'
        else
            session[:user_id] = user.id
            @user = user
            redirect_to '/welcome/home'
        end
    end 

    def destroy
        session.delete :name
        redirect_to '/welcome/home'
    end

end

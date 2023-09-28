class UsersController < ApplicationController
   
    def index
        if !params.empty?
            params.each do |k, v|
                user = User.find_by("? = ?", k, v)

                render json: user
            end
        else
            render json: User.all
        end
    end
    
    def create 
        user = User.new(user_params)
        if user.save
            redirect_to user_url(user)
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    def show
        user = User.find(params[:id])
        if user 
             render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to users_url
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    def destroy
        user = User.find_by(id: params[:id])
        if user && user.destroy
            redirect_to users_url
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 
    end 
    private
    def user_params
        params.require(:user).permit(:username)
    end 
end

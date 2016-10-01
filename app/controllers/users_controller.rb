class UsersController < ApplicationController

   def index
       @users = User.all
   end

    def create
        User.create name: params[:name]
        redirect_to "/users"
    end

    def edit
        user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,:nom,:prenom,:age,:adresse)
    end



end

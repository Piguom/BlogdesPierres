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
        @user = User.new(:date_of_birth => "2010-01-01".to_date)
        if @user
            redirect_to edit_user_registrations_path, notice: "Ok modification"
        end
    end

    def show
        @user = User.find(params[:id])
    end
end

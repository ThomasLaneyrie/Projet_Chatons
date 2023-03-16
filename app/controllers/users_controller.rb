class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  before_action :is_current_user?, only: [:show, :edit]

    def show
        @user = User.find(params[:id])
      
      end
    
      def new
        @user = User.new
      end
    
      def edit
        @user = User.find(current_user.id)
      end
      
      def update
        @user= User.find(current_user.id)
        if @user.update(user_params)
          flash[:success] = "You got it! Your profile is updated!"
          redirect_to user_path(@user)
        end
      end
      
      private 
      def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :address, :city, :zip_code)
      end
end

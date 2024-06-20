class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]

    def find_user
        @user = User.find(params[:id])
        @posts = @user.posts
        @comments = @user.comments
      end

    def new
        @user = User.new
    end


    def create
        user = User.new user_params
        if user.save
            redirect_to posts_path
        else
            render :new
        end
    end


    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
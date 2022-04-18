class V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :ok
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: @user, status: :ok
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def showmodal
        @user = User.find(params[:user_id])
        if @user.present
            render json: @user, status: :ok
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    private
    def user_params
        params.required(:user).permit(:username, :password)
    end
end

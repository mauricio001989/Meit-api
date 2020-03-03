module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, only: [:index]

      # GET /api/v1/users + key
      def index
        render json: User.all
      end

      # GET /api/v1/users/user + key
      def show
        render json: current_user
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        return render json: @user, status: :created if @user.save

        render json: @user.errors, status: :unprocessable_entity
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end

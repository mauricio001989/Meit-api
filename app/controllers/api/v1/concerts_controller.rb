module Api
  module V1
    class ConcertsController < ApplicationController
      before_action :authenticate_user, only: [:create]

      # GET /api/v1/concerts
      def index
        render json: Concert.all
      end

      # POST /api/v1/concerts + Key
      def create
        @concert = Concert.new(concert_params)
        return render json: @concert, status: :created if @concert.save

        render json: @concert.errors, status: :unprocessable_entity
      end

      private

      def concert_params
        params.require(:concert).permit(:name, :city)
      end
    end
  end
end

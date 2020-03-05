module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user, only: %i[index create]

      # GET /api/v1/comments + Key
      def index
        render json: Comment.all
      end

      # POST /api/v1/comments + Key
      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          ActionCable.server.broadcast 'ChatChannel', @comment
          return render json: @comment, status: :created
        end

        render json: @comment.errors, status: :unprocessable_entity
      end

      private

      def comment_params
        params.require(:comment).permit(:concert_id, :user_id, :comment)
      end
    end
  end
end

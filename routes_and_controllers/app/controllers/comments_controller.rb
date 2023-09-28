class CommentsController < ApplicationController
    def index
        if params.has_key?(:user_id)
            comments = Comment.where("author_id = ?", params[:user_id])
        else
            comments = Comment.where("artwork_id = ?", params[:artwork_id])
        end
        render json: comments
    end
end

class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        @comment.build_post
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def index
        @comments = Comment.all
    end

    def create    
        
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to new_post_path, notice: "comment sending"
        else
            render :new
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id, post_attributes: [:tital] )
    end
end

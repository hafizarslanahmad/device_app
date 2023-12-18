class PostsController < ApplicationController
    
    def new
        @post = Post.new
        @post.comments.build
        
    end

    def show
        @post = Post.find(params[:id])
        #@post.build_comment
        @comment = @post.comments.build
        
        
   
    end

    def index
        @posts = Post.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
        # post = Post.create(post_params)
        #  redirect_to post
        redirect_to post_path(@post.id) , notice: "create post"
         else
         render :new
        end
    end

    private
    def post_params
        params.require(:post).permit(:tital, :field , :user_id,  comments_attributes: [:comment, :user_id])
    end
end

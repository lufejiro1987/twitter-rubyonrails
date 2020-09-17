class PostsController < ApplicationController
    
    def index
        @post = Post.all
    end
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            redirect_to posts_path
        end
    end

    # def create
    #     byebug
    #     Post.create(title: params[:title], content: params[:content], autor: params[:autor])
    #     redirect_to root_path
    # end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirecto_to root_path
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :autor)
    end
end

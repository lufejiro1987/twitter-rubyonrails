class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show; end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        
        if @post.save
            redirect_to root_path, notice: 'has creado un nuevo post'
        else
            redirect_to posts_path, alert: 'el post no ha sido creado'
        end
    end

    def edit; end
    
    def update
        if @post.update(post_params)
            redirect_to root_path, notice: 'actualizado correctamente'
        else
            redirect_to edit_post_path(params[:id]), alert: 'no se ha podido actualizar'
        end
    end

    def destroy
        @post_title = @post.title
        @post.destroy
        redirect_to root_path, notice: "el post #{@post_title} ha sido eliminado"
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :autor)
    end

    def set_post
        @post = Post.find(params[:id]) 
    end

end

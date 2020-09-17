class PostsController < ApplicationController
    
    def index
        @posts = Post.all
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
            redirect_to root_path, notice: 'has creado un nuevo post'
        else
            redirect_to posts_path, alert: 'el post no ha sido creado'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to root_path, notice: 'actualizado correctamente'
        else
            redirect_to edit_post_path(params[:id]), alert: 'no se ha podido actualizar'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post_title = @post.title
        @post.destroy
        redirect_to root_path, notice: "el post #{@post_title} ha sido eliminado"
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :autor)
    end
end

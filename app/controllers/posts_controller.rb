class PostsController < ApplicationController

  def start
  end

  def new
    # Instanciar o objeto POSTAGEM - model.
    @post = Post.new
  end

  # Outros métodos que vão manipular o objeto acima instaciado.

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2)
    # It was changed for Post.all >>> Post.paginate
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.present?
      @post.destroy
    end
    redirect_to posts_path

  end

  # def count_like
  #   @post = Post.find(params[:id])
  #   # pega o id do post e
  # end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end

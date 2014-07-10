class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update]

def index
  @posts = Post.all
end

def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to @post, notice: "Your post was added."
  else
    render :new
  end
end

def update
  if @post.update(post_params)
    redirect_to @post, notice: "Your post was updated."
  else
    render :edit
  end
end

private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :screenshot)
  end

end

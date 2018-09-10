class PostsController < ApplicationController
  before_action :authenticate_user!
  
  # C 만들기 ----------------------------------------
  def new
  end

  def create
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.user_id = current_user.id
    @post.save

    redirect_to "/posts/show/#{@post.id}"
  end

  # R 보여주기 ----------------------------------------
  def index
    @posts =Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  # U 수정하기 ----------------------------------------
  def edit
    @post = Post.find(params[:id])
  end

  def update

    # 현재 유저랑 글쓴이가 같을 경우에만
    if current_user.id == @post.user_id 
      @post = Post.find(params[:id])
      @post.title = params[:input_title]
      @post.content = params[:input_content]
      @post.user_id = current_user.id
      @post.save
      
      redirect_to "/posts/show/#{@post.id}"
    else 
      redirect_to :back
    end
  end

  # D 삭제하기 ----------------------------------------
  def destroy

    # 현재 유저랑 글쓴이가 같을 경우에만
    if current_user.id == @post.user_id 
      @post = Post.find(params[:id])
      @post.destroy
    
      redirect_to "/posts/index"
    else
      redirect_to :back
    end
  end
end

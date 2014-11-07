class PostsController < ApplicationController
  before_filter :admin_required, only: [:approve, :destroy]
  skip_before_filter :login_required, only: [:index, :show]

  # GET /posts
  def index
    @posts = Post.visible_to(current_user)
    @post = Post.new
  end

  # GET /posts/:id
  def show
    @post  = Post.find_by_id!(params[:id])
    return access_denied unless @post.visible_to?(current_user)
    @posts = [@post]
    @user  = @post.user
    @no_avatars = true
  end

  # PUT /posts/:id/approve
  def approve
    post = Post.find_by_id!(params[:id])
    post.approved = true
    if post.save
      render text: "<b>Post Approved</b>"
    else
      render text: "<b>Whoops. Something whent wrong</b>"
    end
  end

  # DELETE /posts/:id
  def destroy
    post = Post.find_by_id!(params[:id])
    post.delete
    render text: "<b>Post Deleted</b>"
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to "/"
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:message)
  end
end

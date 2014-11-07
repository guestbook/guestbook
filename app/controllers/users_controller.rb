class UsersController < ApplicationController
  skip_before_filter :login_required, only: [:show, :index]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user  = User.find_by_id!(params[:id])
    @posts = Post.visible_to(current_user).where(user: @user)
    @no_avatars = true
  end
end

class PostsController < ApplicationController
  def index
    @posts=Post.all.order(created_at: :desc)
  end
  def show
    @post=Post.find_by(id:params[:id])
    @user=@post.user
  end
  def new
  end
  def create
    @post=Post.new(content:params[:content],user_id:@current_user.id)
    @post.save
    redirect_to("/posts/index")
  end
  def destroy
    @post=Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/posts/destroy")
  end
  private
 def post_params
  params.require(:post).permit(:title, :text, :img)
 end
end

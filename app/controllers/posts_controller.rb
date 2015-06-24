class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]
  before_action only: [:destroy] do     
    render_404 unless current_user.admin?
  end

  def index
    respond_with Post.all
  end
  
  def create
    respond_with Post.create(post_params.merge(user_id: current_user.id))
  end
  
  def show
    respond_with Post.find(params[:id])
  end
  
  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)

    respond_with post
  end 

  def downvote
    post = Post.find(params[:id])
    post.decrement!(:upvotes)

    respond_with post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    respond_with post
  end  


  private

    def post_params
      params.require(:post).permit(:title, :body)
    end   

    def render_500
      render file: "#{Rails.root}/public/500.html", layout: false, status: 404
    end  

end

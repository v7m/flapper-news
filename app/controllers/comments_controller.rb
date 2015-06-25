class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]
  before_action only: [:destroy] do     
    render_404 unless current_user.admin?
  end
  
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with post, comment
  end
  
  def upvote
    user = current_user
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    user.vote_for(comment)
    comment.upvotes = comment.votes.count
    comment.save

    respond_with post, comment
  end   

  def downvote
    user = current_user
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id]) 
    user.vote_against(comment)
    comment.upvotes = comment.votes.count
    comment.save

    respond_with post, comment
  end 

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy

    respond_with post, comment
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end  

    def render_500
      render file: "#{Rails.root}/public/500.html", layout: false, status: 404
    end 
    
end

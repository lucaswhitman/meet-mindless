class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def food
    posts_for_branch(params[:action])
  end

  def hobby
    posts_for_branch(params[:action])
  end

  private

  def get_posts
    Post.limit(30)
  end
  
  def posts_for_branch(branch)
    @categories = Category.where(branch: branch)
    @posts = get_posts.paginate(page: params[:page])
  end
end

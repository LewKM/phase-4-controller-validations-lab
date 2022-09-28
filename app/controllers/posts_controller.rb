class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  # Posts PATCH /posts/:id with invalid author params returns the error messages
  # Posts PATCH /posts/:id with invalid author params returns a status code of 422 (Unprocessable Entity)

  def update
    post = Post.find(params[:id])
    if post && post.update(post_params)
      render json: post, status: :ok
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end

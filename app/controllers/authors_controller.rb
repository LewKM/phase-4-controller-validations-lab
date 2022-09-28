class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  # Authors POST /authors with invalid author params returns the error messages

  def create
    author = Author.new(author_params)
    if author && author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors }, status: :unprocessable_entity
    end
  end


  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end

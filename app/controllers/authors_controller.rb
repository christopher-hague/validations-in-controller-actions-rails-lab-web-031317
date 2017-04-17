class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    # instantiate new  instance according to params
    @author = Author.new(author_params)

    # if valid
    if @author.valid?
      # save and redirect
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end

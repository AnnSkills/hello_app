class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])
  end

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end
  def create
    @link = Link.new(params.require(:link).permit(:link, :description))
    if @link.save
      flash[:notice] = "Link was created successfully."
    redirect_to @link
    else
      render 'new'
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(params.require(:link).permit(:link, :description))
      flash[:notice] = "Link edited"
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end
end

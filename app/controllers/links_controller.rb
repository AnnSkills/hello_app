class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @links = Link.paginate(page: params[:page], per_page: 3)
  end

  def new
    @link = Link.new
  end

  def edit
  end
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      flash[:notice] = "Link was created successfully."
    redirect_to @link
    else
      render 'new'
    end
  end

  def update
    if @link.update(link_params)
      flash[:notice] = "Link edited"
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to links_path
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:link, :description)
  end

end

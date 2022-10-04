class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  # GET /users/1 or /users/1.json
  def show
    @links = @user.links.paginate(page: params[:page], per_page: 3)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Registration is successfully for User #{@user.username}"
      redirect_to links_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = "You account information was updated"
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account and all connected links were deleted"
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own link"
      redirect_to @user
    end
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.create(user_params)
  # end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice]="Person was updated successfully!"
      redirect_to(users_path)
    else
      flash[:error]="Person was not updated."
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :show, :destroy]

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
  end

  def update
    if @user.update(user_params)
      flash[:notice]="Person was updated successfully!"
      redirect_to(users_path)
    else
      flash[:error]="Person was not updated."
      render :edit
    end
  end

  def show
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def destroy
    if @user.destroy
      flash[:alert]="User successfully deleted. Thank you for joining."
    end
    redirect_to(root_path)
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
    unless @user
      render(text: "User not found.", status: :not_found)
    end
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)

  def send_sms
    user = current_user
    basket = Basket.find(params[:basket_id])
    recipient = basket.user

    body = "Your basket (#{basket.name}) is being delivered by #{user.name}"

    user.send_sms(recipient, body)

    redirect_to users_path, :alert => 'SMS Sent'
  end

end

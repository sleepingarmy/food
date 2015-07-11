class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def send_sms
    user = current_user
    basket = Basket.find(params[:basket_id])
    recipient = basket.user

    body = "Your basket (#{basket.name}) is being delivered by #{user.name}"

    user.send_sms(recipient, body)

    redirect_to users_path, :alert => 'SMS Sent'
  end

end

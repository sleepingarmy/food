class AddressesController < ApplicationController
  before_action :find_address, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user! 
  # skip_before_action :verify_authenticity_token, only: :completed
	def index
		@addresses = Address.all
	end

	def new
		@address = Address.new

	end

	def create
    @address=Address.create(address_params)
    if @adddress.save
      flash[:notice]="Address created"
      redirect_to("")
    else
      flash[:error]="Address not created."
      render :new
    end
	end

	def edit
	end

	def update
    if @address.update(address_params)
      flash[:notice]="address was updated successfully!"
      redirect_to("")
    else
      flash[:error]="address was not updated."
      render :edit
    end
	end

  def destroy
    if @address.destroy
      flash[:alert]="address was successfully deleted!"
    end
    redirect_to("")
  end

	private
  def address_params
    params.require(:address).permit(:street, :apt_num, :city, :state, :zip)
  end

  def find_address
    @address = address.find_by(id: params[:id])
    unless @address
      render(text: "address not found.", status: :not_found)
    end
  end
end

class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
	before_action :require_user

	def index
		@customers = Customer.all
	end

	def show
  end

	def new
		@customer = Customer.new
		@address = Address.new
	end

	def edit
  end

	def create
		_customer_params, _address_params = customer_params
		@customer = Customer.new(name: _customer_params[:name], email: _customer_params[:email], mobile: _customer_params[:mobile])
		@address = Address.new(address_1: _address_params[:address_1], address_2: _address_params[:address_2], district: _address_params[:district],
			state: _address_params[:state], postal_code: _address_params[:postal_code])

    respond_to do |format|
    	if @address.save
    	  @customer.address = @address
	      if @customer.save
	        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
	        format.json { render :show, status: :created, location: @customer }
	      else
	        format.html { render :new }
	        format.json { render json: @customer.errors, status: :unprocessable_entity }
	      end
	    else
	    	format.html { render :new }
	      format.json { render json: @address.errors, status: :unprocessable_entity }
	    end
    end
	end

	def update
		_customer_params, _address_params = customer_params
    respond_to do |format|
    	if @address.update(address_1: _address_params[:address_1], address_2: _address_params[:address_2], district: _address_params[:district],
				state: _address_params[:state], postal_code: _address_params[:postal_code])
	      if @customer.update(name: _customer_params[:name], email: _customer_params[:email], mobile: _customer_params[:mobile])
	        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
	        format.json { render :show, status: :ok, location: @customer }
	      else
	        format.html { render :edit }
	        format.json { render json: @customer.errors, status: :unprocessable_entity }
	      end
	    else
	    	format.html { render :edit }
	      format.json { render json: @address.errors, status: :unprocessable_entity }
	    end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
      @address = @customer.address
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :mobile, :email, :address_1, :address_2, :district, :state, :postal_code)
      return params[:customer].slice(:name, :mobile, :email), params[:customer].except(:name, :mobile, :email)
    end
end

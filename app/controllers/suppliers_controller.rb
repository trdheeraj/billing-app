class SuppliersController < ApplicationController
	before_action :set_supplier, only: [:show, :edit, :update, :destroy]
	before_action :require_user

	def index
		@suppliers = Supplier.all
	end

	def show
	end

	def new
		@supplier = Supplier.new
		@address = Address.new
	end

	def edit
	end

	def create
		_supplier_params, _address_params = supplier_params
		@supplier = Supplier.new(name: _supplier_params[:name], email: _supplier_params[:email], mobile: _supplier_params[:mobile])
		@address = Address.new(address_1: _address_params[:address_1], address_2: _address_params[:address_2], district: _address_params[:district],
			state: _address_params[:state], postal_code: _address_params[:postal_code])

		respond_to do |format|
			if @address.save
				if @supplier.save
					@supplier.address = @address
					format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
					format.json { render :show, status: :created, location: @supplier }
				else
					format.html { render :new }
					format.json { render json: @supplier.errors, status: :unprocessable_entity }
				end
			else
				format.html { render :new }
				format.json { render json: @address.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		_supplier_params, _address_params = supplier_params
		respond_to do |format|
			if @address.update(address_1: _address_params[:address_1], address_2: _address_params[:address_2], district: _address_params[:district],
				state: _address_params[:state], postal_code: _address_params[:postal_code])
				if @supplier.update(name: _supplier_params[:name], email: _supplier_params[:email], mobile: _supplier_params[:mobile])
					format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
					format.json { render :show, status: :ok, location: @supplier }
				else
					format.html { render :edit }
					format.json { render json: @supplier.errors, status: :unprocessable_entity }
				end
			else
				format.html { render :edit }
				format.json { render json: @address.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@supplier.destroy
		respond_to do |format|
			format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_supplier
		@supplier = Supplier.find(params[:id])
		@address = @supplier.address
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def supplier_params
		params.require(:supplier).permit(:name, :mobile, :email, :address_1, :address_2, :district, :state, :postal_code)
		return params[:supplier].slice(:name, :mobile, :email), params[:supplier].except(:name, :mobile, :email)
	end
end

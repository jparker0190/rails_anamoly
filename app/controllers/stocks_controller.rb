class StocksController < ApplicationController
 skip_before_action :verify_authenticity_token
 before_action :set_stock, only: [:show, :edit, :update, :destroy]

 # GET /stocks
 def index
   @stocks = Stock.all
 end

 # GET /stocks/:id
 def show
 end

 # GET /stocks/new
 def new
   @stock = Stock.new
 end

 # GET /stocks/:id/edit
 def edit
 end

 # POST /stocks
 def create
   @stock = Stock.new(stock_params)

   respond_to do |format|
     if @stock.save
       format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
       format.json { render :show, status: :created, location: @stock }
     else
       format.html { render :new }
       format.json { render json: @stock.errors, status: :unprocessable_entity }
     end
   end
 end

 # PATCH/PUT /stocks/:id
 def update
   respond_to do |format|
     if @stock.update(stock_params)
       format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
       format.json { render :show, status: :ok, location: @stock }
     else
       format.html { render :edit }
       format.json { render json: @stock.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /stocks/:id
 def destroy
  # @stock.destroy
   #respond_to do |format|
    # format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
     #format.json { head :no_content }
   #end
   Stock.find_by(:id => params[:id]).destroy
   redirect_to stocks_path
 end

 private
   def set_stock
     @stock = Stock.find(params[:id])
   end

   def stock_params
     params.require(:stock).permit(:ticker, :price)
   end
end

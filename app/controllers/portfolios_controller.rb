class PortfoliosController < ApplicationController
 before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

 # GET /portfolios adding commit  
 #only shows the current user's portfolio
 def index
   @portfolios = current_user.portfolios.includes(:stocks).all


 end

 # GET /portfolios/:id
 def show
 end

 # GET /portfolios/new
 def new
   @portfolio = Portfolio.new
 end

 # GET /portfolios/:id/edit
 def edit
 end

 # POST /portfolios

 def create
   @portfolio = current_user.portfolios.new(portfolio_params)

   respond_to do |format|
     if @portfolio.save
       format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
       format.json { render :show, status: :created, location: @portfolio }
     else
       format.html { render :new }
       format.json { render json: @portfolio.errors, status: :unprocessable_entity }
     end
   end
 end

 # PATCH/PUT /portfolios/:id
 def update
   respond_to do |format|
     if @portfolio.update(portfolio_params)
       format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
       format.json { render :show, status: :ok, location: @portfolio }
     else
       format.html { render :edit }
       format.json { render json: @portfolio.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /portfolios/:id
 def destroy
   @portfolio.destroy
   respond_to do |format|
     format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private
   def set_portfolio
     @portfolio = Portfolio.find(params[:id])
   end

   def portfolio_params
     params.require(:portfolio).permit(:name)
   end
end

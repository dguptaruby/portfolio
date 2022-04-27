class YourStocksController < ApplicationController
  
  def new
    @your_stocks = YourStock.new
  end

  def create
    @your_stock = YourStock.create(your_stock_params)
    if @your_stock.errors.present?
      flash[:alert] = @your_stock.errors.messages[:buy_price][0]
    end
    redirect_to root_path
  end

  private

  def your_stock_params
    params.require(:your_stock).permit(:stock_symbol, :buy_price, :quatity)
  end
end

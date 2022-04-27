class HomeController < ApplicationController
  def index
    @your_stocks = YourStock.where(holding: false)
  end

  def add_amount
    amount = params[:amount]
    if amount.to_f > 0
      balance = YourAmount.first
      balance.update(amount: amount.to_f+balance.amount.to_f)      
    end
    redirect_to root_path
  end
end

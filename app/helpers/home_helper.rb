module HomeHelper
  def profit(stock)
    ((stock.get_current_price[:current_price].round(2)-stock.buy_price.to_f)*stock.quatity).round(2)
  end
end

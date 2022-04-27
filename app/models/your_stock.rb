class YourStock < ApplicationRecord

  has_many :transactions
  validate :check_price, :check_symbol, :check_balance

  after_save :create_transaction

  def get_current_price
    FetchDataService.new(stock_symbol).call
  end

  private
  
  def check_price
    data = FetchDataService.new(stock_symbol).call
    if buy_price.to_f < data[:current_price]
      errors.add(:buy_price, "price should be greater then current price #{data[:current_price].round(2)}")
    end
  end

  def check_symbol
    data = FetchDataService.new(stock_symbol).call
    if data[:current_price] === 0.0
      errors.add(:buy_price, "#{stock_symbol} symbol is not persent")
    end
  end

  def check_balance
    total_amount = buy_price.to_f * quatity
    account_amount = YourAmount.first.amount.to_f
    unless account_amount >= total_amount
      errors.add(:amount, "Your Balance is insufficient please add amount")
    end
  end

  def create_transaction
    amount = (self.holding ? self.sell_price.to_f : self.buy_price.to_f) * self.quatity
    self.transactions.create!(amount: amount)
    balance = YourAmount.first
    balance.update(amount: (balance.amount.to_f - amount))
  end
end

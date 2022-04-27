class FetchDataService

  def initialize(symbol)
    @symbol = symbol.upcase
  end

  def call
    begin
      stock_data = JSON.parse fetch_data(symbol: @symbol)
      current_price = stock_data["chart"]["result"][0]["indicators"]["quote"][0]["close"][-1]
      previce_price = stock_data["chart"]["result"][0]["indicators"]["quote"][0]["close"][-2]
      percentage = ((current_price - previce_price) * 100)/previce_price
      {"current_price":current_price.nil? ? 0.0 : current_price, "percentage":percentage.nil? ? 0.0 : percentage}
    rescue
      {"current_price":current_price.nil? ? 0.0 : current_price, "percentage":percentage.nil? ? 0.0 : percentage}
    end
  end

  private
  def fetch_data(symbol: "AAPL", range: "5d", interval: "1d")
    headers = {'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, sdch, br',
    'Accept-Language': 'en-GB,en-US;q=0.8,en;q=0.6',
    'Connection': 'keep-alive',
    'Host': 'www1.nseindia.com',
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36',
    'X-Requested-With': 'XMLHttpRequest'}
    response = Faraday.get("https://query1.finance.yahoo.com/v8/finance/chart/#{symbol}?symbol=#{symbol}.NS&range=#{range}&interval=#{interval}", headers)
    response.body
  end


end
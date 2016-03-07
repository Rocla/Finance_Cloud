class Stock < ActiveRecord::Base
  def self.retrieve_stock_by_ticker(ticker)
    retrieved_stock = StockQuote::Stock.quote(ticker)
    return nil unless retrieved_stock.name

    new_stock = new(name: retrieved_stock.name, ticker: retrieved_stock.symbol)
    new_stock.last_value = new_stock.latest_value
    new_stock
  end

  def latest_value
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price

    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price

    "Unable to fetch latest price"
  end
end

class Ticker < ActiveRecord::Base
  has_many :trades
  has_many :comments, as: :commentable

  def self.create_or_update(symbol_dict)
    symbol = symbol_dict["symbol"]
    name = symbol_dict["name"]
    exchange = symbol_dict["exch"]
    instrument_type = symbol_dict["type"]
    exchange_name = symbol_dict["exchDisp"]
    fund = symbol_dict["typeDisp"]

    ticker = self.where(title: symbol)
    if ticker != nil
      Ticker.create!(title: symbol,
        name: name,
        exch: exchange,
        exch_name: exchange_name,
        instrument: instrument_type,
        instrument_name: fund
        )
    end
  end
end

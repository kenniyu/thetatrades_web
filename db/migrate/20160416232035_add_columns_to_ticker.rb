class AddColumnsToTicker < ActiveRecord::Migration
  def change
    add_column :tickers, :exch, :string
    add_column :tickers, :exch_name, :string
    add_column :tickers, :instrument, :string
    add_column :tickers, :instrument_name, :string
  end
end

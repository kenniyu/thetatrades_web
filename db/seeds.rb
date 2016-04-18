# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

ticker1 = Ticker.create!(title: 'SPX', name: 'S&P 500 Index')
ticker2 = Ticker.create!(title: 'DJX', name: 'Dow Jones Industrial Average Index')
ticker3 = Ticker.create!(title: 'NDX', name: 'Nasdaq 100 Index')
ticker4 = Ticker.create!(title: 'RUT', name: 'Russell 2000 Index')
ticker5 = Ticker.create!(title: 'AAPL', name: 'Apple Inc Com')

trade1 = Trade.create!(title: 'Slow Grind Higher on AAPL', description: RandomData.random_paragraph, ticker: ticker5)
trade2 = Trade.create!(title: 'Bearish on SPX', description: RandomData.random_paragraph, ticker: ticker1)
trade3 = Trade.create!(title: 'Bullish on NDX', description: RandomData.random_paragraph, ticker: ticker3)
trade4 = Trade.create!(title: 'Bullish on DJX', description: RandomData.random_paragraph, ticker: ticker2)

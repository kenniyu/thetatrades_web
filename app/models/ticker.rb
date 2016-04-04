class Ticker < ActiveRecord::Base
  has_many :trades
end

class TradesController < ApplicationController
  before_filter :authenticate_user!

  require "uri"
  require "net/http"

  class Exchange
    WHITELIST = ["PCX", "NAS", "NYQ", "NMS", "NYM"]
    BLACKLIST = ["OPR", "MEX", "FRA"]
  end

  def index
  end

  def show
    @trade = Trade.find_by(id: params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @ticker = Ticker.where(title: params[:trade][:ticker]).first
    @trade = Trade.new(trade_params)
    @trade.ticker = @ticker
    @trade.user = current_user

    if @trade.save
      redirect_to @trade, notice: "Trade idea created!"
    else
      flash.now[:alert] = "Error creating trade. Please try again."
      render :new
    end
  end

  def symbol
    query = params[:query]

    url = URI.parse("http://d.yimg.com/aq/autoc?query=#{query}&region=US&lang=en-US")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    parsed_json = ActiveSupport::JSON.decode(res.body)
    result_set = parsed_json["ResultSet"]
    results = result_set["Result"]

    valid_results = []
    results.each do |symbol_dict|
      exchange = symbol_dict["exch"]

      if Exchange::WHITELIST.include?(exchange)
        valid_results << symbol_dict
        Ticker.create_or_update(symbol_dict)
      end
    end

    render :json => valid_results

  end

  private

  def trade_params
    params.require(:trade).permit(:title, :description)
  end
end

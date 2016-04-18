class WelcomeController < ApplicationController
  def index
    @trades = Trade.includes(:comments)
    @filter = (["all", "popular", "following", "mine"].include? params[:filter]) ? params[:filter] : "all"
  end
end

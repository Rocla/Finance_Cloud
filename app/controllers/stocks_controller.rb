class StocksController < ApplicationController
  def home
  end

  def search
    if params[:ticker]
      @stock = Stock.where(params.permit(:ticker).to_h).first
      @stock ||= Stock.retrieve_stock_by_ticker(params[:ticker])
    end
    if @stock
      render partial: 'search_result'
    else
      render status: :not_found, nothing: true
    end
  end
end

class StocksController < ApplicationController
  # before_action :current_stock_ref, only: [:show]

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

  def show
    if params[:ticker]
      @stock = Stock.where(params.permit(:ticker).to_h).first
      @stock ||= Stock.retrieve_stock_by_ticker(params[:ticker])
    end
    if !@stock
      redirect_to stocks_path
    end
  end

  private
    def current_stock_ref
      @stock = Stock.find(params[:ticker])
    end
end

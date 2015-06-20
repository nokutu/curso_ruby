class HomeController < ApplicationController
  def index
    if session[:calculation].nil?
      @calculation = Calculation.new
    else
      @calculation = Calculation.find(session[:calculation])
    end
    @products = Product.all.order(:name)
    render "home/index"
  end
end

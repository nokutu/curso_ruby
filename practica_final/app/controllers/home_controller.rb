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

  def result
    @calculation = Calculation.find(session[:calculation])
  end

  def again
    session[:calculation] = nil
    redirect_to "/"
  end
end

class HomeController < ApplicationController
  def index
    @calculation = Calculation.find_or_create_by(:id => session[:calculation])
    @products = Product.all.order(:name)
  end

  def result
    @calculation = Calculation.find(session[:calculation])
  end

  def again
    @calculation = Calculation.find(session[:calculation])
    @calculation = Calculation.new({:email => @calculation.email,
                                    :phone_number => @calculation.phone_number,
                                    :name => @calculation.name,
                                    :post_code => @calculation.post_code})
    redirect_to "/"
  end
end

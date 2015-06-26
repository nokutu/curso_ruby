class CalculationsController < ApplicationController
  include ApplicationHelper

  def step1
    @calculation = Calculation.new(calculation_params)
    @calculation.save
    @errors = @calculation.errors
    session[:calculation] = @calculation.id
    respond_to do |format|
      format.js{}
    end
  end

  def code
    calculation = Calculation.find(decode(params[:code])).first
    unless calculation.nil?
      @calculation = Calculation.new(:name => calculation.name,
                                     :phone_number => calculation.phone_number,
                                     :email => calculation.email,
                                     :post_code => calculation.post_code)
      @calculation.save
      session[:calculation] = @calculation.id
      session[:oldCalculation] = calculation.id
    end
    respond_to do |format|
      format.js{}
    end
  end

  private

  def calculation_params
    params.require(:calculation).permit(:name, :phone_number, :email, :post_code)
  end
end

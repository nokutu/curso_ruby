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
    puts "--------------------------"
    puts decode(params[:calculation][:code])
    puts params[:calculation][:code]
    @calculation = Calculation.find(decode(params[:calculation][:code])).first
    puts @calculation.id
    session[:calculation] = @calculation.id
    respond_to do |format|
      format.js{}
    end
  end

  private

  def calculation_params
    params.require(:calculation).permit(:name, :phone_number, :email, :post_code)
  end
end

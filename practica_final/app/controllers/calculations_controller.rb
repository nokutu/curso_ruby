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
    @calculation = Calculation.find(decode(params[:code])).first

    unless @calculation.nil?
      session[:calculation] = @calculation.id
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

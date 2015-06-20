class CalculationLinesController < ApplicationController

  def step2
    @calculation = Calculation.find(session[:calculation])
    calculation_id = @calculation.id

    Product.all.each do |product|
        calculation_line = CalculationLine.find_or_create_by(:calculation_id => calculation_id, :product_id => product.id)
        calculation_line.assign_attributes(get_params(product))
        unless calculation_line.hours.nil? or calculation_line.amount.nil?
          if (calculation_line.hours.to_i > 0  and calculation_line.amount.to_i > 0)
            calculation_line.save()
          end
        end
    end
    respond_to do |format|
      format.js{}
    end
  end

  private

  def get_params(product)
    params.require(product.id.to_s).permit(:hours, :amount)
  end
end

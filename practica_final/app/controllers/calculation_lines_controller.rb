class CalculationLinesController < ApplicationController

  def step2
    @calculation = Calculation.find(session[:calculation])
    calculation_id = @calculation.id

    i = 0
    while true
      if params[i.to_s].nil?
        break
      end
      calculation_line = CalculationLine.find_or_create_by(:calculation_id => calculation_id,
                                                           :product_id => params[i.to_s][:product_id])
      calculation_line.assign_attributes(:hours => params[i.to_s][:hours],
                                         :amount => params[i.to_s][:amount])
      puts calculation_line.product_id

      unless calculation_line.hours.nil? or calculation_line.amount.nil?
        if (calculation_line.hours.to_i > 0  and calculation_line.amount.to_i > 0)
          calculation_line.save!
        end
      end
      i += 1
    end
    respond_to do |format|
      format.js{}
    end
  end
end

class CalculationLinesController < ApplicationController

  def step2
    @calculation = Calculation.find(session[:calculation])
    CalculationLine.where(:calculation_id => @calculation.id).destroy_all
    @errors = []
    i = 0
    while true
      if params[i.to_s].nil?
        break
      elsif !params[i.to_s][:remove].nil?
        i += 1
        next
      elsif params[i.to_s][:product_id] == "0"
        @errors += [i]
        i += 1
        next
      end

      calculation_line = CalculationLine.new(:calculation_id => @calculation.id,
                                                           :product_id => params[i.to_s][:product_id])
      calculation_line.assign_attributes(:hours => params[i.to_s][:hours],
                                         :amount => params[i.to_s][:amount])
      unless calculation_line.save
        @errors += [i]
      end
      i += 1
    end
    respond_to do |format|
      format.js{}
    end
  end
end

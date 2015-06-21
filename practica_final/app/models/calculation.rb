class Calculation < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :post_code, presence: true

  has_many :calculation_lines

  ELECTRICITY_PRICE = 0.15

  def get_power_diff
    power_led = 0
    power_incandescent = 0
    calculation_lines.each do |calculation_line|
      power_led += calculation_line.product.power_led * calculation_line.amount
      power_incandescent += calculation_line.product.power_incandescent * calculation_line.amount
    end
    power_incandescent - power_led
  end

  def get_cost
    cost = 0
    calculation_lines.each do |calculation_line|
      cost += calculation_line.product.price_led * calculation_line.amount
    end
    cost
  end

  def get_amortization_time
    ((get_cost / ((get_power_diff / 1000.0) * ELECTRICITY_PRICE))/30).to_int + 1
  end

  def get_monthly_save
    ((get_power_diff / 1000.0) * ELECTRICITY_PRICE) * 30
  end

  def amortization_string
    ret = ""
    if get_amortization_time > 12
      ret += (get_amortization_time / 12).to_s + " years"
      if get_amortization_time.modulo(12) != 0
        ret += " and " + get_amortization_time.modulo(12).to_s + " months"
      end
    else
      ret += get_amortization_time.modulo.to_s + " months"
    end
    ret
  end
end

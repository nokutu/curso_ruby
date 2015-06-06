class Product < ActiveRecord::Base

  def gastos_de_envio
    self.price.to_f * 0.1
  end
end

class TableController < ApplicationController

  def step2
    Product.all.each do |product|
        table = Table.new(get_params(product))
        table.save()
    end
    redirect_to '/'
  end

  private

  def get_params(product)
    params.require(product.id.to_s).permit(:hours, :amount)
  end
end

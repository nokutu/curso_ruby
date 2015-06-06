module ProductsHelper

  def show_stock(product)
    return 'No disponible' if product.stock.nil? || product.stock < 0
    product.stock
  end
end

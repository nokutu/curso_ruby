class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def clear_image
    @product = Product.find(params[:id])
    @product.image.destroy
    redirect_to :back
  end

  def delete
    @product = Product.find(params[:id])
    @product.petitions.each {|p| p.delete}
    @product.delete
    redirect_to "/"
  end

  def return
    @product = Product.find(params[:id])
    @product.lent = false
    @product.save
    redirect_to :back
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "The product was correctly created"
      redirect_to '/'
    else
      render 'new'
    end

  end

  def update
    params[:product][:lendable] = false if params[:product][:lendable].nil?
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "The product was correctly updated"
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def borrow
    @product = Product.fin(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :kind, :state, :description, :pricenew, :pricenow, :state, :image, :lendable)
  end
end

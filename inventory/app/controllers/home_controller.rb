class HomeController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by,
        with_lent: Product.options_for_select
      }
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.js
      format.html
    end
    #@petitions = Petition.all
    #@products = Product.order("lendable is true desc, lent is true desc, name asc").page(params[:page]).per(10)
  end

  def set_language
    I18n.locale = params["lang"]
    current_user.language = params["lang"]
    current_user.save
    redirect_to :back
  end
end

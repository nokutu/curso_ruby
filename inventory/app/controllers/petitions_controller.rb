class PetitionsController < ApplicationController
  before_action :require_admin, only: [:accept, :reject]

  def borrow
    @product = Product.find(params[:id])
    @petition = Petition.new
  end

  def index
    if current_user.role == "admin"
      @petitions = Petition.order("accepted is null desc, created_at desc").page(params[:page]).per(10)
    else
      @petitions = Petition.where(user_id: current_user.id).order("created_at").page(params[:page]).per(10)
    end
  end

  def accept
    @petition = Petition.find(params[:id])
    @petition.product.lent = true
    @petition.accepted = true
    @petition.save
    @petition.product.save
    UserMailer.notification(@petition.user, @petition).deliver_now
    respond_to do |format|
      format.js{}
      format.html
    end
  end

  def reject
    @petition = Petition.find(params[:id])
    @petition.accepted = false
    @petition.save
    UserMailer.notification(@petition.user, @petition).deliver_now
    respond_to do |format|
      format.js{}
      format.html
    end
  end

  def new_petition
    params[:petition][:user_id] = current_user.id
    params[:petition][:product_id] = params[:id]

    @petition = Petition.new(petition_params)
    if @petition.save
      flash[:notice] = "The petition has been created"
      redirect_to "/"
    else
      render "borrow"
    end
  end

  private

  def petition_params
    params.require(:petition).permit(:lend_start_date, :lend_end_date ,:description, :user_id, :product_id)
  end

  def require_admin
    authorize! :manage, @petition
  end
end

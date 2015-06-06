class UsersController < ApplicationController
  before_action :admin_require, except: [:configuration, :update_self]

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "The user has been created"
      redirect_to "/users/index"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    puts @user.email
    if params[:user][:email] == @user.email
      params[:user].delete :email
    end
    @user.update(user_params)
    if @user.save
      flash[:notice] = "The user has been edited"
      redirect_to "/users/index"
    else
      render "edit"
    end
  end

  def update_self
    @user = current_user
    puts @user.email
    if params[:user][:email] == @user.email
      params[:user].delete :email
    end
    @user.update(user_params)
    if @user.save
      flash[:notice] = "The user has been edited"
      redirect_to "/"
    else
      render "edit"
    end
  end

  def index
    @users = User.order("fullname asc").page(params[:page])
    authorize! :manage, @user
  end

  def show
    @user = User.find(params[:id])
  end

  def configuration
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/", alert: "You don't have pemissions to access this"
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :password, :password_confirmation, :role, :email)
  end

  def admin_require
    authorize! :manage, @user
  end
end

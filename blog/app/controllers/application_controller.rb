class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_session

  def load_pagination
    params[:page] = 1 if params[:page].nil?
    params[:page] = params[:page].to_i
  end

  def paginate(class_name, page, order = "")
    class_name.order(order).limit(class_name::PER_PAGE).offset((page - 1) * class_name::PER_PAGE)
  end

  def check_session
    session[:login_cookie] ||= Session.find_by cookie: cookies[:login_cookie]
    login_cookie = session[:login_cookie]
    @is_loged = !Session.find_by_cookie(login_cookie).nil?
    if @is_loged
      @user = Session.find_by_cookie(login_cookie).author
    end
  end

  def require_login
    if @user.nil?
      flash[:notice] = "Tienes que estar logueado para hacer esto"
      redirect_to "/"
    end
  end

  def require_admin
    if @user.nil? || @user.role != "admin"
      flash[:error] = "No puedes entrar aquí"
      redirect_to "/"
    end
  end
end

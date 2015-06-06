class HomeController < ApplicationController

  protect_from_forgery with: :exception

  def index
    load_pagination
    @posts = paginate(Post, params[:page], "created_at desc")
  end

  def login
    credentials = user_params
    @user = Author.find_by_nickname(credentials[:username])

    if !@user.nil? && @user.password == credentials[:password]
      params[:session] = {}
      params[:session][:author_id] = @user.id unless @user.nil?
      loop do
        params[:session][:cookie] = (0...8).map{(65+rand(58)).chr}.join
        @session = Session.new(session_params)
        break if @session.save
      end
      session[:login_cookie] =  @session.cookie
      if credentials[:remember]
        cookies[:login_cookie] = { :value => @session.cookie, :expires => 1.week.from_now }
      end
      puts cookies[:login_cookie]
    else
      flash[:error] = "Usuario y/o contraseña incorrecto"
    end
    redirect_to (:back)
  end

  def logout
    Session.delete_all(:cookie => session[:login_cookie])
    session[:login_cookie] = nil
    cookies.delete(:login_cookie)
    redirect_to :back
  end

  def user_params
    params.require(:login).permit(:username, :password, :remember)
  end

  def session_params
    params.require(:session).permit(:cookie, :author_id)
  end
end

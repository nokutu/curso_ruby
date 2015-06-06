class AuthorsController < ApplicationController
  before_action :set_authors, only: [:show, :edit, :update, :destroy]

  before_action :require_admin, only: [:index, :new, :create]
  before_action :require_owner_or_admin, only: [:show, :edit]

  def index
    load_pagination
    @authors = Author.all
    @authors = paginate(Author, params[:page], "created_at asc")
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to "/authors", notice: 'El Autor fue creado correctamente.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @author.id == 1
      flash[:error] = "No se puede modificar a este usuario"
      redirect_to(:back) and return
    end
    params[:author].delete(:password) if params[:author][:password] == ""
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'El Autor fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def register
    @author = Author.new(author_params)
    @author.role = "user"
    if @author.save
      flash[:notice] = "Te has registrado correctamente"
      redirect_to "/"
    else
      flash[:not_registered] = @author.errors
      redirect_to "/"
    end
  end

  def destroy
    if @author.id == 1
      flash[:error] = "Este usuario es indestructible"
      redirect_to(:back) and return
    end
    if @author == @user
      Session.delete_all(:cookie => session[:login_cookie])
      session[:login_cookie] = nil
      cookies.delete(:login_cookie)
    end
    @author.posts.each { |p| p.destroy }
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'El Autor fue destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authors
    @author = Author.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def author_params
    params.require(:author).permit(:name, :surname, :nickname, :email, :password, :role)
  end

  def require_owner_or_admin
    unless @author.id == @user.id || @user.role == "admin"
      flash[:error] = "No puedes entrar aquí"
      redirect_to "/"
    end
  end
end

class PostsController < ApplicationController
  before_action :set_posts, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: :new
  before_action :is_owner, except: [:new, :create]
  before_action :require_owner_or_admin, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = @user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/", notice: 'El Post fue creado correctamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'El Post fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.comments.each { |c| c.destroy }
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'El Post fue destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_posts
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :intro, :body, :author_id, :created_at)
  end

  def require_owner_or_admin
    unless @is_owner
      flash[:error] = "No puedes entrar aquí"
      redirect_to "/"
    end
  end

  def is_owner
    @is_owner = true unless @user.nil? || (@user.role != "admin" && @post.author != @user)
  end
end

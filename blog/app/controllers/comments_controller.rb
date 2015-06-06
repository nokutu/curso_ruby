class CommentsController < ApplicationController
  before_action :set_comments, only: [:show, :edit, :update, :destroy, :delete]
  before_action :require_login, only: :new
  before_action :require_owner_or_admin, only: [:edit, :update, :destroy, :delete]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    params[:comment][:author_id] = @user.id
    params[:comment][:post_id] = params[:post_id]
    params[:comment][:reply_to_id] = params[:reply_to_id]
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js {}
        format.html { redirect_to "/posts/#{@comment.post_id}", notice: "El Comentario fue creado correctamente."}
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to "/posts/#{@comment.post.id}", notice: 'El Comentario fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'El Comentario fue destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  def delete
    @comment.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to "/posts/#{@comment.post.id}", notice: 'El Comentario fue destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  def is_owner(comment)
    !@user.nil? && (@user.role == "admin" || comment.author == @user)
  end

  private

  def require_owner_or_admin
    if @user.nil? || (@user.role != "admin" && @post.author != @user)
      flash[:error] = "No puedes entrar aquí"
      redirect_to "/"
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comments
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:comment_id, :post_id, :content, :reply_to_id, :author_id)
  end
end

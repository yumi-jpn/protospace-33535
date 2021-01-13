class PrototypesController < ApplicationController
  before_action :redirect_new_user_session, only:[:new, :edit, :destroy]
  before_action  :move_to_edit, only:[:edit, :destroy, :update]

  def index
    @prototypes = Prototype.all
    @user = current_user
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
     @prototype = Prototype.find(params[:id])
     @comment = Comment.new
     @comments = @prototype.comments.includes(:user)
     @user = User.find_by(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if prototype = Prototype.find(params[:id])
      prototype.user_id == current_user.id
      prototype.update(update_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    if prototype = Prototype.find(params[:id])
       prototype.user_id == current_user.id
       prototype.destroy
       redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def redirect_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_edit
    unless Prototype.find(params[:id]).user.id.to_i == current_user.id
    redirect_to action: :index
    end
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :is_admin?
  semantic_breadcrumb "Users", :users_path

  def index
    @users = User.all
  end

  def new
    semantic_breadcrumb "Create", new_user_path
    @user = User.new
  end

  def edit
    semantic_breadcrumb @user.email
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      semantic_breadcrumb "Create", new_user_path
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, alert: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:email,:password,:is_admin)
    end

    def is_admin?
      unless current_user.is_admin
        redirect_to root_path, alert: 'Access denied.'
      end
    end
end

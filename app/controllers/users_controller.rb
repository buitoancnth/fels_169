class UsersController < ApplicationController
  before_action :load_user, only: :show
  before_action :logged_in_user, only: [:index, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.order_by_user.paginate page: params[:page], per_page: Settings.per_pages
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,:password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "notuser"
    redirect_to root_path
  end
end

class UsersController < ApplicationController
  before_action :load_user, only: [:show, :destroy]
  before_action :logged_in_user, only: [:index, :show]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def index
    @users = User.order_by_user.paginate page: params[:page], per_page: Settings.per_pages
  end

  def show
    @activities = Activity.activities_by(@user.id).order_by_activity
      .paginate page: params[:page], per_page: Settings.per_pages
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "message.delete_success"
    make_activity t(:destroy_user), user
    redirect_to users_path
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

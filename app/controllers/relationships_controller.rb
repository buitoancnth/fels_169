class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :load_create, only: :create
  before_action :load_destroy, only: :destroy

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def load_create
   @user = User.find params[:followed_id]
    return if @user
    flash[:danger] = t "error"
    redirect_to root_path
  end

  def load_destroy
    @user = Relationship.find(params[:id]).followed
    return if @user
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

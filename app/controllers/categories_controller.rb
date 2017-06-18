class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories = Category.order_by_category.paginate page: params[:id], per_page: Settings.per_pages
  end

  def show
    @lessons = @category.lessons.user_start(current_user).paginate page: params[:page],
    per_page: Settings.per_pages
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:dranger] = t "notcagetory"
    redirect_to category_path
  end
end

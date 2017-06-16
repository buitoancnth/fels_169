class CategoriesController < ApplicationController
  before_action :load_category

  def index
    @categories = Category.order_by_category.paginate page: params[:id], per_page: Settings.per_pages
  end

  def show

  end

  def load_category
    @categories = Category.find_by id: params[:id]
    @lesson = @categories.lessons
  end
end

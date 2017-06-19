class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.order_by_category.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def destroy
    @category.destroy
    make_activity t("delete_category"),@category
    redirect_to admin_categories_path
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t"message.create_success"
      make_activity t("create_category"), @category
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "message.update_success"
      make_activity t("update_category"), @category
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end
end

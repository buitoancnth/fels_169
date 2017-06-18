class LessonsController < ApplicationController
  include LessonsHelper
  before_action :logged_in_user, unless: :json_request?
  before_action :load_category, only: [:create]
  before_action :load_lesson, only: [:update, :show, :destroy]

  def show
  end

  def create
    @lesson = Lesson.new category_id: @category.id, user_id: current_user.id
    if @lesson.save
      flash[:success] = t "message.create_success"
      make_activity t("startlesson"), "Lesson: #{@lesson.id}", current_user
      redirect_to @lesson
    else
      failed_message = t "message.create_failed"
      flash[:danger] = failed_message
      redirect_to @category
    end
  end
  def update
    if @lesson && @lesson.update_attributes(lesson_params)
      flash[:success] = t "message.update_success"
      make_activity t("startlesson"), "Lesson: #{@lesson.id}", current_user.id
    else
      if @lesson.present?
        failed_message = @lesson.errors
      else
        failed_message = t "message.update_failed"
      end
      flash[:danger] = failed_message
    end

    redirect_to @lesson
  end

  def destroy
    @lesson.destroy
    flash[:success] = t "message.delete_success"
    make_activity t("startlesson"), "Lesson: #{@lesson.id}", current_user.id
    redirect_to @lesson.category
  end

  private

  def lesson_params
    params.require(:lesson).permit :is_learned, lesson_words_attributes: [:id, :answer_id]
  end

  def load_category
    @category = Category.find params[:category_id]
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
  end
end

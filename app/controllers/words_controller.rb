class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.per_pages
    if !params[:category_id].nil? && params[:category_id].empty?
      if params[:option] == "all_word"
        @words = Word.all
      else
        @words = Word.send params[:option], current_user.id
      end
    elsif category = @categories.find_by(id: params[:category_id])
      if params[:option] == "all_word"
        @words = category.words.all
      else
       @words = category.words.send params[:option], current_user.id
      end
    else
      @words = Word.all
    end
    @words = @words.paginate page: params[:page], per_page: Settings.per_pages
  end
end

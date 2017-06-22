class StaticPagesController < ApplicationController
  def home
    if current_user.present?
      @activities = Activity.activities_by(current_user.id).order_by_activity
        .paginate page: params[:page], per_page: Settings.per_pages
    end
  end

  def help
  end
end

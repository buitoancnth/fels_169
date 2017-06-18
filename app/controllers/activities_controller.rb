class ActivitiesController < ApplicationController
  def show
    @activities = Activity.all
  end
end

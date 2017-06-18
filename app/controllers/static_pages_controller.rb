class StaticPagesController < ApplicationController
  def home
    @activities = Activity.all
  end

  def help
  end
end

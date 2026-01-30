class PagesController < ApplicationController
  def home
    @featured_animals = Animal.order(created_at: :desc).limit(6)
    @total_animals = Animal.count
  end

  def about
  end
end

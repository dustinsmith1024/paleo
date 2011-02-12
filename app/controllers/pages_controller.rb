class PagesController < ApplicationController
  def search
    if params[:search_terms]
      @recipes = Recipe.find(:all, :conditions => ["instructions like ?",'%' + params[:search_terms] + "%"])
    else
#      @recipes = Recipe.all
    end
  end

  def contact
  end

  def about
  end

end

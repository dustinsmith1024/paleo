class PagesController < ApplicationController

#  def search ## SEARCHED FOR RECIPES BASED ON NAME AND INSTRUCTIONS/WILL NEED AN INGREDIENT ONE LATER...
#    if params[:search_terms]
#      @recipes = Recipe.find(:all, :conditions => ["name like ? or instructions like ?",'%' + params[:search_terms] + "%", '%' + params[:search_terms] + "%"])
#    else
##      @recipes = Recipe.all
#    end
#  end

  def contact
  end

  def about
  end

end

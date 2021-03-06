class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  def index
    if params[:category]
   ## MOVE TO MODEL  ->  NEED TO SEARCH BY INGREDIENTS
      @recipes = Recipe.find(:all, :conditions => ["name like ? or instructions like ?",'%' + params[:category] + "%", '%' + params[:category] + "%"])
    else
      @recipes = Recipe.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    3.times do
      ingredient = @recipe.ingredients.build()
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end
    def search ## SEARCHED FOR RECIPES BASED ON NAME AND INSTRUCTIONS/WILL NEED AN INGREDIENT ONE LATER...
      @recipes = []
      
      if !params[:search].blank?
        search = params[:search].split(' ')
        search.each_with_index do |s,index|
          s = "%#{s}%"
          @recipes << Recipe.joins(:ingredients).find(:all, :conditions => ["recipes.name LIKE (?) or instructions like (?) or ingredients.name like (?)", s, s, s])
        end
        @recipes.flatten!.uniq!
      end
logger.info(@recipes.to_json)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @recipes }
        format.js   { render :layout => false } 
      end

    end

  def search2 ## SEARCHED FOR RECIPES BASED ON NAME AND INSTRUCTIONS/WILL NEED AN INGREDIENT ONE LATER...
    @recipes = []

    if params[:search]
      #@recipes = Recipe.find(:all, :conditions => ["name like ? or instructions like ?",'%' + params[:search] + "%", '%' + params[:search] + "%"])
      params[:search] = '%' + params[:search] + '%'
      @recipes = Recipe.joins(:ingredients).where((:name.matches % params[:search]) | {:ingredients => [:name.matches % params[:search]]}).uniq

#    loop through the ingredients and search for them base on the name
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipes }
      format.js   { render :layout => false } 
    end

  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.empty?
    3.times do
      ingredient = @recipe.ingredients.build()
    end
    end
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
end

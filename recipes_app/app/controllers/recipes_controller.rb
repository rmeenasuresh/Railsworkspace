class RecipesController < ApplicationController
	def index
		@recipe=Recipe.all
	end
	def show
		@recipe = Recipe.find(params[:id])

end
def new
	@recipe = Recipe.new
end
def create
	@recipe = Recipe.new(recipe_params)
	@recipe.save
  flash.notice = " '#{@recipe.rname}'Recipe is Updated!"

	redirect_to recipes_path
end
def destroy
	@recipe = Recipe.find(params[:id])
	@recipe.destroy
	redirect_to recipes_path
end
def edit
	@recipe = Recipe.find(params[:id])
end 

def update
	@recipe = Recipe.find(params[:id])
	@recipe.update(recipe_params)
	  flash.notice = " '#{@recipe.rname}'Recipe is Updated!"

		redirect_to recipes_path
end

def recipe_params
  params.require(:recipe).permit(:rname, :aname,:ingredients,:method)
end
end
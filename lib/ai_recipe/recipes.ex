defmodule AiRecipe.Recipes do
  alias AiRecipe.RecipeGenerator

  def create_recipe(instructions), do: RecipeGenerator.generate(instructions)
end

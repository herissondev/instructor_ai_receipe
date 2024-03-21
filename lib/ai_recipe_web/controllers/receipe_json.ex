defmodule AiRecipeWeb.RecipeJSON do
  alias AiRecipe.Recipes.Recipe

  @doc """
  Renders a single recipe.
  """
  def show(%{recipe: recipe}) do
    Poison.encode!(recipe) |> Poison.decode!()
  end
end

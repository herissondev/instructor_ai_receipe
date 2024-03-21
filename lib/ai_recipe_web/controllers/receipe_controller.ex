defmodule AiRecipeWeb.RecipeController do
  use AiRecipeWeb, :controller

  alias AiRecipe.Recipes

  action_fallback AiRecipeWeb.FallbackController

  def generate(conn, %{"user_instructions" => instructions}) do
    with recipe <- Recipes.create_recipe(instructions) do
      IO.inspect("here my boy")

      conn
      |> put_status(:created)
      |> render(:show, recipe: recipe)
    end
  end
end

defmodule AiRecipe.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AiRecipe.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{

      })
      |> AiRecipe.Recipes.create_recipe()

    recipe
  end
end

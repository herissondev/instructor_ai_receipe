defmodule AiRecipe.Recipe do
  use Ecto.Schema
  use Instructor.Validator

  alias AiRecipe.Recipe.Step
  alias AiRecipe.Recipe.Ingredient

  @doc """
  A food recipe, with ingredients and steps

  name: short recipe name
  total_estimated_duration: total estimated duration for the recipe
  total_estimated_price: total estimated price for the recipe
  ingredients: all ingredients required for the recipe
  steps: all steps required to make the recipe
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:total_estimated_duration, :integer)
    embeds_many(:ingredients, Ingredient)
    embeds_many(:steps, Step)
  end
end

defmodule AiRecipe.Recipe.Ingredient do
  use Ecto.Schema
  use Instructor.Validator

  @doc """
  An ingredient from a recipe.
  (name) : ingredient's name
  (emoji) : single emoji coresponding to the ingredient
  (quantity) number representing the quantity
  (quantity_unit) the quantity's unit (can be null if not necessary)
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:emoji, :string)
    field(:quantity, :float)
    field(:quantity_unit, :string)
  end
end

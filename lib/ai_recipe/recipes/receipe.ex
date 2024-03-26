defmodule AiRecipe.Recipe do
  use Ecto.Schema
  use Instructor.Validator

  alias AiRecipe.Recipe.Step
  alias AiRecipe.Recipe.Ingredient

  @doc """
  Defines the schema for a food recipe. A food recipe is a detailed guide on how to prepare a specific dish, including the name of the dish, the total time and cost estimated to prepare it, a list of ingredients required, and a series of steps outlining the cooking process.

  - name: The name of the recipe, providing a brief and catchy description of the dish.
  - total_estimated_duration: The total estimated time required to prepare and cook the dish, measured in minutes.
  - total_estimated_price: An approximate cost to prepare the dish, intended as a guideline to help users gauge the expense.
  - steps: A detailed sequence of actions or instructions to follow for preparing the dish, embedded as `Step` structures. This covers everything from initial preparation to final serving suggestions, ensuring clarity and ease of follow-through for the user.
  - ingredients: A comprehensive list of all ingredients needed for the recipe, embedded as `Ingredient` structures. This includes quantities, preparation notes, and any specific variants of ingredients.
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:total_estimated_duration, :integer)
    field(:total_estimated_price, :float)
    embeds_many(:steps, Step)
    embeds_many(:ingredients, Ingredient)
  end
end

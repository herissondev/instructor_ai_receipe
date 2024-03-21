defmodule AiReceipe.Receipe do
  use Ecto.Schema
  use Instructor.Validator

  alias AiReceipe.Receipe.Step
  alias AiReceipe.Receipe.Ingredient

  @doc """
  A food receipe, with ingredients and steps

  name: short receipe name
  total_estimated_duration: total estimated duration for the receipe
  total_estimated_price: total estimated price for the receipe
  ingredients: all ingredients required for the receipe
  steps: all steps required to make the receipe
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:total_estimated_duration, :integer)
    embeds_many(:ingredients, Ingredient)
    embeds_many(:steps, Step)
  end
end

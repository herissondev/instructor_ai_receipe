defmodule AiReceipe.Receipe.Ingredient do
  use Ecto.Schema
  use Instructor.Validator

  @doc """
  An ingredient from a receipe.
  (name) : ingredient's name
  (quantity) number representing the quantity
  (quantity_unit) the quantity's unit (can be null if not necessary)
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:quantity, :float)
    field(:quantity_unit, :string)
  end
end
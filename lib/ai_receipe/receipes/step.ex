defmodule AiReceipe.Receipe.Step do
  use Ecto.Schema
  use Instructor.Validator

  @doc """
  A receipe step.
  (name) : step's name
  (description) step description
  (needs_timer) true if the step requires a timer (ie: cooking 20minutes)
  (timer_duration) timer duration in minutes if required
  """
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:description, :string)
    field(:needs_timer, :boolean, default: false)
    field(:timer_duration, :float, default: 0.0)
  end
end

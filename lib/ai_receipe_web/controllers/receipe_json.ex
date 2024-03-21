defmodule AiReceipeWeb.ReceipeJSON do
  alias AiReceipe.Receipes.Receipe

  @doc """
  Renders a single receipe.
  """
  def show(%{receipe: receipe}) do
    Poison.encode!(receipe) |> Poison.decode!()
  end
end

defmodule AiReceipe.ReceipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AiReceipe.Receipes` context.
  """

  @doc """
  Generate a receipe.
  """
  def receipe_fixture(attrs \\ %{}) do
    {:ok, receipe} =
      attrs
      |> Enum.into(%{

      })
      |> AiReceipe.Receipes.create_receipe()

    receipe
  end
end

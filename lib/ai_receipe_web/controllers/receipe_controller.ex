defmodule AiReceipeWeb.ReceipeController do
  use AiReceipeWeb, :controller

  alias AiReceipe.Receipes

  action_fallback AiReceipeWeb.FallbackController

  def generate(conn, %{"user_instructions" => instructions}) do
    with receipe <- Receipes.create_receipe(instructions) do
      IO.inspect("here my boy")

      conn
      |> put_status(:created)
      |> render(:show, receipe: receipe)
    end
  end
end

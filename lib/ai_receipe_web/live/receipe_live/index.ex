defmodule AiReceipeWeb.ReceipeLive.Index do
  alias Phoenix.LiveView.AsyncResult
  use AiReceipeWeb, :live_view

  alias AiReceipe.Receipes
  import AiReceipeWeb.CustomComponents

  @base %AiReceipe.Receipe{
    name: "Chocolate Pearl Ice Cream Dessert",
    total_estimated_duration: 60,
    ingredients: [
      %AiReceipe.Receipe.Ingredient{
        name: "chocolate pearls",
        emoji: "🍫",
        quantity: 1.5,
        quantity_unit: "cups"
      },
      %AiReceipe.Receipe.Ingredient{
        name: "ice cream",
        emoji: "🍦",
        quantity: 2.0,
        quantity_unit: "cups"
      },
      %AiReceipe.Receipe.Ingredient{
        name: "cookies",
        emoji: "🍪",
        quantity: 1.5,
        quantity_unit: "cups"
      }
    ],
    steps: [
      %AiReceipe.Receipe.Step{
        name: "Melt Chocolate Pearls",
        description: "Melt the chocolate pearls in a double boiler until smooth.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiReceipe.Receipe.Step{
        name: "Crush Cookies",
        description: "Crush the cookies into small crumbs.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiReceipe.Receipe.Step{
        name: "Assemble Dessert",
        description:
          "Layer the melted chocolate pearls, crushed cookies, and scoops of ice cream in a serving dish.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiReceipe.Receipe.Step{
        name: "Garnish",
        description: "Top with additional chocolate pearls for garnish.",
        needs_timer: false,
        timer_duration: 0.0
      }
    ]
  }

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      # |> assign(:receipe, AsyncResult.ok(@base))

      |> assign(:receipe, nil)

    {:ok, socket}
  end

  @impl true
  def handle_event("generate", %{"user_instructions" => instructions}, socket) do
    socket =
      socket
      |> assign(:receipe, AsyncResult.loading())
      |> start_async(:generate_receipe, fn ->
        Receipes.create_receipe(instructions)
      end)

    {:noreply, socket}
  end

  @impl true
  def handle_async(:generate_receipe, {:ok, generated_receipe}, socket) do
    %{receipe: receipe} = socket.assigns
    IO.inspect(generated_receipe)
    {:noreply, assign(socket, :receipe, AsyncResult.ok(receipe, generated_receipe))}
  end
end

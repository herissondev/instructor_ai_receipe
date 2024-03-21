defmodule AiRecipeWeb.RecipeLive.Index do
  alias Phoenix.LiveView.AsyncResult
  use AiRecipeWeb, :live_view

  alias AiRecipe.Recipes
  import AiRecipeWeb.CustomComponents

  @base %AiRecipe.Recipe{
    name: "Chocolate Pearl Ice Cream Dessert",
    total_estimated_duration: 60,
    ingredients: [
      %AiRecipe.Recipe.Ingredient{
        name: "chocolate pearls",
        emoji: "🍫",
        quantity: 1.5,
        quantity_unit: "cups"
      },
      %AiRecipe.Recipe.Ingredient{
        name: "ice cream",
        emoji: "🍦",
        quantity: 2.0,
        quantity_unit: "cups"
      },
      %AiRecipe.Recipe.Ingredient{
        name: "cookies",
        emoji: "🍪",
        quantity: 1.5,
        quantity_unit: "cups"
      }
    ],
    steps: [
      %AiRecipe.Recipe.Step{
        name: "Melt Chocolate Pearls",
        description: "Melt the chocolate pearls in a double boiler until smooth.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiRecipe.Recipe.Step{
        name: "Crush Cookies",
        description: "Crush the cookies into small crumbs.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiRecipe.Recipe.Step{
        name: "Assemble Dessert",
        description:
          "Layer the melted chocolate pearls, crushed cookies, and scoops of ice cream in a serving dish.",
        needs_timer: false,
        timer_duration: 0.0
      },
      %AiRecipe.Recipe.Step{
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
      |> assign(:user_instructions, nil)
      # |> assign(:recipe, AsyncResult.ok(@base))

      |> assign(:recipe, nil)

    {:ok, socket}
  end

  @impl true
  def handle_event("generate", %{"user_instructions" => instructions}, socket) do
    socket =
      socket
      |> assign(:user_instructions, instructions)
      |> assign(:recipe, AsyncResult.loading())
      |> start_async(:generate_recipe, fn ->
        Recipes.create_recipe(instructions)
      end)

    {:noreply, socket}
  end

  @impl true
  def handle_async(:generate_recipe, {:ok, generated_recipe}, socket) do
    %{recipe: recipe} = socket.assigns
    {:noreply, assign(socket, :recipe, AsyncResult.ok(recipe, generated_recipe))}
  end
end

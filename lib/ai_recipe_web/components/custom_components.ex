defmodule AiRecipeWeb.CustomComponents do
  use AiRecipeWeb, :html

  attr :ingr, :map, required: true

  def ingredient(assigns) do
    ~H"""
    <div class="flex flex-row bg-gray-100 gap-4 p-2 rounded-lg justify-between text-center items-center align-midle">
      <div class="flex flex-row items-center gap-2 w-[80%]">
        <p class="text-2xl bg-gray-200 p-2 px-3 rounded-lg"><%= @ingr.emoji %></p>
        <p class="h-full font-bold capitalize"><%= @ingr.name %></p>
      </div>
      <p><%= @ingr.quantity %> <%= @ingr.quantity_unit %></p>
    </div>
    """
  end

  attr :step, :map, required: true
  attr :index, :integer, required: true
  attr :last, :boolean, default: false

  def step(assigns) do
    ~H"""
    <li>
      <div class="relative pb-8">
        <span
          :if={!@last}
          class="absolute left-4 top-4 -ml-px h-full w-0.5 bg-gray-200"
          aria-hidden="true"
        >
        </span>
        <div class="relative flex space-x-1">
          <div>
            <span class={"h-8 w-8 rounded-full bg-gray-400 flex items-center justify-center ring-8 ring-white #{if @last do "bg-green-700" else "bg-gray-400" end} "}>
              <p class="text-sm font-medium text-white"><%= @index + 1 %></p>
            </span>
          </div>
          <div class="flex-auto rounded-md p-3  ring-1 ring-inset ring-gray-200">
            <div class="flex justify-between gap-x-4">
              <div class="py-0.5 text-xs leading-5 text-gray-500">
                <span class="font-medium text-gray-900"><%= @step.name %></span>
              </div>
              <time
                :if={@step.timer_duration > 0}
                class="flex-none py-0.5 text-xs leading-5 text-gray-500"
              >
                <%= @step.timer_duration %> mins
              </time>
            </div>
            <p class="text-sm leading-6 text-gray-500">
              <%= @step.description %>
            </p>
          </div>
        </div>
      </div>
    </li>
    """
  end

  def input_intructions(assigns) do
    ~H"""
    <div class="flex items-start space-x-4 p-4 w-full md:w-[50%]">
      <div class="min-w-0 flex-1">
        <form phx-submit="generate" class="relative">
          <div class="overflow-hidden rounded-lg shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-indigo-600">
            <label for="user_instructions" class="sr-only">Generate recipe</label>
            <textarea
              rows="3"
              name="user_instructions"
              id="user_instructions"
              class="block w-full resize-none border-0 bg-transparent py-1.5 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6 disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-transparent disabled:placeholder:text-gray-400 disabled:focus:ring-0 disabled:sm:text-sm disabled:sm:leading-6 disabled:bg-gray-50"
              placeholder="Add your ingredients or ask for a recipe suggestion..."
            ></textarea>
            <!-- Spacer element to match the height of the toolbar -->
            <div class="py-2" aria-hidden="true">
              <!-- Matches height of button in toolbar (1px border + 36px content height) -->
              <div class="py-px">
                <div class="h-9"></div>
              </div>
            </div>
          </div>

          <div class="absolute inset-x-0 bottom-0 flex flex-row-reverse justify-between py-2 pl-3 pr-2">
            <div class="flex-shrink-0">
              <button
                id="generate-button"
                phx-click={loading_state()}
                class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:cursor-not-allowed disabled:opacity-50 disabled:bg-indigo-600 disabled:hover:bg-indigo-600 disabled:focus-visible:outline disabled:focus-visible:outline-2 disabled:focus-visible:outline-offset-2 disabled:focus-visible:outline-indigo-600"
              >
                <div id="loading-icon" class="hidden">
                  <.icon name="hero-arrow-path" class="animate-spin h-5 w-5 mr-2" />
                </div>
                <div id="generate-icon">
                  <.icon name="hero-bolt" class="h-5 w-5 mr-2" />
                </div>
                Generate
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
    """
  end

  defp loading_state(js \\ %JS{}) do
    js
    |> JS.show(to: "#loading-icon")
    |> JS.hide(to: "#generate-icon")
  end
end

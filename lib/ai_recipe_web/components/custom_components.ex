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

  def step(assigns) do
    ~H"""
    <li>
      <div class="relative pb-8">
        <span class="absolute left-4 top-4 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true"></span>
        <div class="relative flex space-x-1">
          <div>
            <span class="h-8 w-8 rounded-full bg-gray-400 flex items-center justify-center ring-8 ring-white">
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
end

defmodule AiReceipeWeb.CustomComponents do
  use AiReceipeWeb, :html

  attr :ingredient, :map, required: true

  def ingredient(assigns) do
    ~H"""
    <div class="flex flex-row bg-gray-100 gap-4 p-2 rounded-lg justify-between text-center items-center align-midle">
      <div class="flex flex-row items-center gap-2 w-[80%]">
        <p class="text-2xl bg-gray-200 p-2 px-3 rounded-lg"><%= @ingredient.emoji %></p>
        <p class="h-full font-bold capitalize"><%= @ingredient.name %></p>
      </div>
      <p><%= @ingredient.quantity %><%= " " <> @ingredient.quantity_unit %></p>
    </div>
    """
  end

  def step(assigns) do
    ~H"""
    <li class="relative flex gap-x-4">
      <div class="absolute left-0 top-0 flex w-6 justify-center -bottom-6">
        <div class="w-px bg-gray-200"></div>
      </div>
      <div class="relative flex items-center justify-center h-6 w-6 border bg-gray-50 rounded-full">
        <span class="text-center "><%= @index + 1 %></span>
      </div>
      <div class="flex-auto rounded-md p-3 ring-1 ring-inset ring-gray-200">
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
    </li>
    """
  end
end

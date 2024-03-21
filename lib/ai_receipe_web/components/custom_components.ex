defmodule AiReceipeWeb.CustomComponents do
  use AiReceipeWeb, :html

  attr :ingredient, :map, required: true

  def ingredient(assigns) do
    ~H"""
    <div class="flex flex-row bg-gray-100 max-w-[400px] gap-4 p-4 rounded-lg text-center items-center align-midle">
      <p class="text-2xl bg-gray-200 p-2 px-3 rounded-lg"><%= @ingredient.emoji %></p>
      <p class="h-full font-bold capitalize"><%= @ingredient.name %></p>
      <p><%= @ingredient.quantity %><%= " " <> @ingredient.quantity_unit %></p>
    </div>
    """
  end
end

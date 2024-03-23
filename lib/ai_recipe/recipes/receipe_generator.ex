defmodule AiRecipe.RecipeGenerator do
  alias AiRecipe.Recipe

  @doc """
  Generates a recipe from the given user instructions
  """
  def generate(user_instructions) when is_binary(user_instructions) do
    case Instructor.chat_completion(
           model: "gpt-3.5-turbo",
           response_model: Recipe,
           max_retries: 1,
           messages: [
             %{
               role: "user",
               content: build_prompt(user_instructions)
             }
           ]
         ) do
      {:ok, recipe} ->
        recipe
    end
  end

  defp build_prompt(user_instructions) do
    """
    Craft a recipe from the user's input.
    Utilize the input to create a flavorful dish, supplementing with basic staples if necessary.
    Offer a complete, step-by-step guide from start to finish.

    --- start instruction ---
    #{user_instructions}
    --- end instruction ---
    """
  end
end

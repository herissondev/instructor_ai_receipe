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
    Generate a food recipe from the given instruction you can add other ingredients but try to use as much of the users ingredients as possible, if none provided invent one from scratch.
    Be precise in the steps. 
    --- start instruction ---
    #{user_instructions}
    --- end instruction ---
    """
  end
end

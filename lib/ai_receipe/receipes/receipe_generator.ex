defmodule AiReceipe.ReceipeGenerator do
  alias AiReceipe.Receipe

  @doc """
  Generates a receipe from the given user instructions
  """
  def generate(user_instructions) when is_binary(user_instructions) do
    case Instructor.chat_completion(
           model: "gpt-3.5-turbo",
           response_model: Receipe,
           max_retries: 1,
           messages: [
             %{
               role: "user",
               content: build_prompt(user_instructions)
             }
           ]
         ) do
      {:ok, receipe} ->
        receipe
    end
  end

  defp build_prompt(user_instructions) do
    """
    Build a food receipe from the given intruction you can add other ingredients but try to use as much of the users ingredients as possible, if none provided invent one from scratch. 
    --- start instruction ---
    #{user_instructions}
    --- end instruction ---
    """
  end
end

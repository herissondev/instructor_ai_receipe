defmodule AiReceipe.Receipes do
  alias AiReceipe.ReceipeGenerator

  def create_receipe(instructions), do: ReceipeGenerator.generate(instructions)
end

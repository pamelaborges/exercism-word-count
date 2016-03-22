defmodule Words do
  @regex ~r/[.^$@_!&,:% ]+/i
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.downcase(sentence)
    |> split
    |> reduce
  end

  defp split(input) do
    String.split(input, @regex, trim: true)
  end

  defp update(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end

  defp reduce(words) do
    Enum.reduce(words, %{}, &(update/2))
  end

end

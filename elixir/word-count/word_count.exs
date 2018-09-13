defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r{[!@#$%^&*():,_]}, " ")
    |> String.downcase()
    |> String.split()
    |> Enum.reduce(%{}, &add_word/2)
  end

  defp add_word(word, words) do
    Map.update(words, word, 1, &(&1 + 1))
  end
end

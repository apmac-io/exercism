defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, &value/2)
  end

  defp value(c, sum \\ 0)
  defp value(c, sum) when c in 'aeioulnrst', do: sum + 1
  defp value(c, sum) when c in 'dg', do: sum + 2
  defp value(c, sum) when c in 'bcmp', do: sum + 3
  defp value(c, sum) when c in 'fhvwy', do: sum + 4
  defp value(c, sum) when c in 'k', do: sum + 5
  defp value(c, sum) when c in 'jx', do: sum + 8
  defp value(c, sum) when c in 'qz', do: sum + 10
  defp value(_, sum), do: sum
end

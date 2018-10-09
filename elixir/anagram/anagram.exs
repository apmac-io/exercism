defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, &anagram?(base, &1))
  end

  defp anagram?(base, candidate) do
    String.downcase(base) != String.downcase(candidate) and
      dismantle(base) == dismantle(candidate)
  end

  defp dismantle(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end

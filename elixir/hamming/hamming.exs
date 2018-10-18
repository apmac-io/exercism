defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2), do: hamming_distance(strand1, strand2, 0)

  defp hamming_distance([], [], acc), do: {:ok, acc}
  defp hamming_distance([h | s1], [h | s2], acc), do: hamming_distance(s1, s2, acc)
  defp hamming_distance([_h1 | s1], [_h2 | s2], acc), do: hamming_distance(s1, s2, acc + 1)
  defp hamming_distance(_s1, _s2, _acc), do: {:error, "Lists must be the same length"}
end

defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(n) do
    [1]
    |> Stream.iterate(&next_row/1)
    |> Enum.take(n)
  end

  defp next_row(previous) do
    previous
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> envelop(1)
  end

  defp envelop(list, n), do: [n] ++ list ++ [n]
end

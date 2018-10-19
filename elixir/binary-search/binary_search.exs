defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) when is_tuple(numbers) do
    numbers |> Tuple.to_list() |> search(key, 0)
  end

  defp search([], _key, _index), do: :not_found

  defp search(numbers, key, index) do
    midpoint = numbers |> length() |> div(2)

    case Enum.at(numbers, midpoint) do
      ^key -> {:ok, index + midpoint}
      n when key < n -> Enum.take(numbers, midpoint) |> search(key, index)
      n when key > n -> Enum.drop(numbers, midpoint + 1) |> search(key, index + midpoint + 1)
    end
  end
end

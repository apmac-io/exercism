defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_coins, 0), do: result([])

  def generate(coins, target) do
    coins
    |> Enum.sort(&(&2 <= &1))
    |> generate(target, [])
    |> Enum.sort(&(&2 <= &1))
    |> List.first()
    |> result()
  end

  def generate([], _target, acc), do: acc

  def generate([head | tail], target, acc) when target < head do
    generate(tail, target, [nil | acc])
  end

  def generate([_head | tail] = coins, target, acc) do
    generate(tail, target, [make_change(coins, coins, target, []) | acc])
  end

  def make_change(_base, _coins, target, acc) when target == 0, do: acc

  def make_change(base, [head | _tail] = coins, target, acc) when head <= target do
    make_change(base, coins, target - head, [head | acc])
  end

  def make_change(base, [_head | []] = _coins, target, acc) do
    make_change(tl(base), tl(base), target + hd(acc), tl(acc))
  end

  def make_change(base, [_head | tail] = _coins, target, acc) do
    make_change(base, tail, target, acc)
  end

  def make_change(_, _, _, _), do: nil

  def result(nil), do: {:error, "cannot change"}
  def result(result), do: {:ok, result}
end

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
  def generate(coins, target) do
    coins
    |> Enum.sort(&(&2 <= &1))
    #|> Enum.filter(&(&1 <= target))
    |> generate(target, [])
    |> Enum.sort(&(&2 <= &1))
    |> IO.inspect()
    |> hd()
    |> output()
  end

  def generate([], _target, acc), do: acc

  def generate(coins, target, acc) do
    generate(tl(coins), target, [make_change(coins, target, []) | acc])
  end

  def make_change(_coins, 0, acc), do: acc

  def make_change([coin | coins], target, acc) when coin <= target do
    make_change([coin | coins], target - coin, [coin | acc])
  end

  def make_change([coin | coins], target, acc) do
    make_change(coins, target, acc)
  end

  def make_change(_, _, _), do: nil

  def output(nil), do: {:error, "cannot change"}
  def output(result), do: {:ok, result}
end

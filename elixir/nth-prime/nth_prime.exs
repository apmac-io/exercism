defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count <= 0, do: raise(ArgumentError)
  def nth(count), do: nth([2], 3, count)

  defp nth(primes, _n, count) when length(primes) == count, do: hd(primes)

  defp nth(primes, n, count) do
    ((Enum.any?(primes, &(rem(n, &1) == 0)) && primes) || [n | primes])
    |> nth(n + 2, count)
  end
end

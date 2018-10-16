defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) do
    valid?(digits, base_a, base_b)
    |> convert(digits, base_a, base_b)
  end

  defp convert(_valid? = false, _, _, _), do: nil

  defp convert(_valid? = true, digits, base_a, base_b) do
    digits |> to_base10(base_a) |> from_base10(base_b)
  end

  defp to_base10(digits, base), do: Enum.reduce(digits, &(&1 + &2 * base))

  defp from_base10(n, base, acc \\ [])
  defp from_base10(0, _base, []), do: [0]
  defp from_base10(0, _base, acc), do: acc
  defp from_base10(n, base, acc), do: from_base10(div(n, base), base, [rem(n, base) | acc])

  defp valid?(digits, base_a, base_b) do
    length(digits) > 0 and base_a >= 2 and base_b >= 2 and
      Enum.all?(digits, &(&1 >= 0 and &1 < base_a))
  end
end

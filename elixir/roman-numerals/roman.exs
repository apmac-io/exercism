defmodule Roman do
  @numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number), do: numerals(number, @numerals)

  defp numerals(number, _numerals) when number <= 0, do: ""

  defp numerals(number, [{threshold, roman} | tail]) when number < threshold do
    numerals(number, tail)
  end

  defp numerals(number, list = [{threshold, roman} | _]) do
    roman <> numerals(number - threshold, list)
  end
end

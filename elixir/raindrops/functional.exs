defmodule Raindrops do
  @drops [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    convert(@drops, number, "")
  end

  def convert(_drops = [], number, _rain = ""), do: Integer.to_string(number)
  def convert(_drops = [], _number, rain), do: rain

  def convert([{factor, sound} | tail], number, rain) when rem(number, factor) == 0 do
    convert(tail, number, rain <> sound)
  end

  def convert([_drop | tail], number, rain), do: convert(tail, number, rain)
end

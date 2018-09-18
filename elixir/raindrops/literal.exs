defmodule Raindrops do
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
    {number, ""}
    |> pling()
    |> plang()
    |> plong()
    |> result()
  end

  def pling(drop), do: sound(drop, 3, "Pling")
  def plang(drop), do: sound(drop, 5, "Plang")
  def plong(drop), do: sound(drop, 7, "Plong")

  def sound(_drop = {number, rain}, factor, sound) when rem(number, factor) == 0,
    do: {number, rain <> sound}

  def sound(_drop = {number, rain}, _factor, _sound), do: {number, rain}

  def result({number, _rain = ""}), do: Integer.to_string(number)
  def result({_number, rain}), do: rain
end

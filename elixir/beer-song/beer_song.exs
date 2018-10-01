defmodule BeerSong do
  @start 99

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{bottles(number) |> String.capitalize()} of beer on the wall, #{bottles(number)} of beer.
    #{action(number)}, #{bottles(number - 1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ @start..0)

  def lyrics(first..last) when first > last do
    verse(first) <> "\n" <> lyrics((first - 1)..last)
  end

  def lyrics(first.._), do: verse(first)

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(n) when n < 0, do: bottles(@start)
  defp bottles(n), do: "#{n} bottles"

  defp action(0), do: "Go to the store and buy some more"
  defp action(1), do: "Take it down and pass it around"
  defp action(_), do: "Take one down and pass it around"
end

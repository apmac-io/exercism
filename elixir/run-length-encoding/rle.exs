defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map_join(&compress/1)
  end

  defp compress([letter]), do: letter
  defp compress(letters = [letter | _]), do: "#{Enum.count(letters)}#{letter}"

  @spec decode(String.t()) :: String.t()
  def decode(string) when string == "", do: ""

  def decode(string) do
    string
    |> Integer.parse()
    |> decode(string)
  end

  defp decode({times, rest}, _string) do
    {first, string} = String.split_at(rest, 1)
    String.duplicate(first, times) <> decode(string)
  end

  defp decode(:error, string) do
    decode({1, string}, string)
  end
end

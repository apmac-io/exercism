defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(&first_and_capitals(String.graphemes(&1)))
    |> List.to_string()
  end

  defp first_and_capitals([first | rest]) do
    [String.upcase(first) | Enum.filter(rest, &capital?/1)]
  end

  defp capital?(char), do: char != String.downcase(char)
end

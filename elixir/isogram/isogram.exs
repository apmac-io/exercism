defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence), do: Regex.scan(~r{\w}u, sentence) |> unique?()

  defp unique?(letters), do: letters == Enum.uniq(letters)
end

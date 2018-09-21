defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      :default -> :unequal
    end
  end

  defp sublist?(_, []), do: false
  defp sublist?(a, b), do: :lists.prefix(a, b) or sublist?(a, tl(b))
end

defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist
  def compare(a, b) when a === b, do: :equal

  def compare(a, b) when length(a) < length(b) do
    compare(a, b, :sublist)
  end

  def compare(a, b) when length(a) > length(b) do
    compare(b, a, :superlist)
  end

  def compare(_a, _b), do: :unequal

  defp compare(a, b, class) when hd(a) === hd(b) do
    case compare(a, Enum.take(b, length(a))) do
      :equal -> class
      :unequal -> compare(a, tl(b), class)
    end
  end

  defp compare(a, b, class) when length(a) < length(b) do
    compare(a, tl(b), class)
  end

  defp compare(_a, _b, _class), do: :unequal
end

defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes()
    |> valid?()
  end

  defp valid?(list, stack \\ [])
  defp valid?([], []), do: true
  defp valid?([], _stack), do: false
  defp valid?(["[" | t], stack), do: valid?(t, ["]" | stack])
  defp valid?(["(" | t], stack), do: valid?(t, [")" | stack])
  defp valid?(["{" | t], stack), do: valid?(t, ["}" | stack])
  defp valid?([char | t], [char | stack]) when char in ["]", ")", "}"], do: valid?(t, stack)
  defp valid?([char | _], _stack) when char in ["]", ")", "}"], do: false
  defp valid?([_ | t], stack), do: valid?(t, stack)
end

defmodule Bob do

  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"
      shout?(input) && question?(input) ->
        "Calm down, I know what I'm doing!"
      question?(input) ->
        "Sure."
      shout?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp silence?(input), do: String.trim(input) == ""
  defp question?(input), do: String.last(input) == "?"
  defp shout?(input), do: String.upcase(input) == input && String.downcase(input) != input

end

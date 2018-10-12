defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map_join(&process/1)
    |> translate()
  end

  defp process("#" <> text), do: header(text, 1)
  defp process("* " <> text), do: "<li>#{text}</li>"
  defp process(text), do: "<p>#{text}</p>"

  defp header("#" <> text, level), do: header(text, level + 1)
  defp header(" " <> text, level), do: "<h#{level}>#{text}</h#{level}>"

  defp translate(text) do
    text
    |> String.replace(~r{__(.*)__}, "<strong>\\1</strong>")
    |> String.replace(~r{_(.*)_}, "<em>\\1</em>")
    |> String.replace(~r{<li>.*</li>}, "<ul>\\0</ul>")
  end
end

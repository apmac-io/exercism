defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    word
    |> String.contains?(["y"] ++ @vowels)
    |> translate_word(word)
    |> append_ay()
  end

  defp translate_word(_valid = false, word), do: word

  defp translate_word(_valid = true, word) do
    word
    |> String.graphemes()
    |> move_consonants()
  end

  defp move_consonants([first | rest]) when first in @vowels do
    first <> List.to_string(rest)
  end

  defp move_consonants(["q", "u" | rest]) do
    List.to_string(rest) <> "qu"
  end

  defp move_consonants([first, next | rest]) when first in ["x", "y"] and next not in @vowels do
    first <> next <> List.to_string(rest)
  end

  defp move_consonants(letters = [first | rest]) do
    move_consonants(rest ++ [first])
  end

  defp append_ay(word), do: word <> "ay"
end

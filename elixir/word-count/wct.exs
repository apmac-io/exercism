  Code.load_file("alt_01.exs", __DIR__)

defmodule WordsTest do
    IO.inspect Words.count("word")
    IO.inspect Words.count("one of each")
    IO.inspect Words.count("one fish two fish red fish blue fish")
    IO.inspect Words.count("car : carpet as java : javascript!!&@$%^&")
    IO.inspect Words.count("testing, 1, 2 testing")
    IO.inspect Words.count("co-operative")
    IO.inspect Words.count("two_words")
    IO.inspect Words.count("go Go GO")
    IO.inspect Words.count("Freude schöner Götterfunken")
end

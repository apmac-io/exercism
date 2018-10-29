defmodule Garden do
  @students ~w[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]a
  @cipher %{"C" => :clover, "G" => :grass, "R" => :radishes, "V" => :violets}
  @width 2

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    student_names
    |> index()
    |> assign(info_string)
    |> Map.new()
  end

  defp index(student_names) do
    student_names
    |> Enum.sort()
    |> Enum.with_index()
  end

  defp assign(students, info_string) do
    Enum.reduce(students, [], fn {name, ix}, acc -> [{name, plants(ix, info_string)} | acc] end)
  end

  defp plants(ix, info_string) do
    info_string
    |> String.split()
    |> Enum.map(&String.graphemes/1)
    |> Enum.flat_map(&Enum.slice(&1, ix * @width, @width))
    |> Enum.map(&@cipher[&1])
    |> List.to_tuple()
  end
end

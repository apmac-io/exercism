defmodule Grains do
  use Bitwise

  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number in 1..64, do: {:ok, do_square(number)}
  def square(_number), do: {:error, "The requested square must be between 1 and 64 (inclusive)"}
  defp do_square(n), do: 1 <<< (n - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total(), do: {:ok, do_square(65) - 1}
end

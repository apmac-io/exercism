defmodule RobotSimulator do
  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with :ok <- validate_direction(direction),
         :ok <- validate_position(position) do
      %{direction: direction, position: position}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot
  def simulate(robot, "L" <> instructions), do: turn_left(robot) |> simulate(instructions)
  def simulate(robot, "R" <> instructions), do: turn_right(robot) |> simulate(instructions)
  def simulate(robot, "A" <> instructions), do: advance(robot) |> simulate(instructions)
  def simulate(_robot, _instructions), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position

  defp validate_direction(direction) when direction in @directions, do: :ok
  defp validate_direction(_direction), do: {:error, "invalid direction"}

  defp validate_position(_position = {x, y}) when is_integer(x) and is_integer(y), do: :ok
  defp validate_position(_position), do: {:error, "invalid position"}

  defp turn_left(robot), do: turn(robot, index(robot) - 1)
  defp turn_right(robot), do: turn(robot, rem(index(robot) + 1, 4))
  defp turn(robot, index), do: %{robot | direction: Enum.at(@directions, index)}
  defp index(robot), do: Enum.find_index(@directions, &(&1 == robot.direction))

  defp advance(robot = %{direction: :north, position: {x, y}}), do: %{robot | position: {x, y + 1}}
  defp advance(robot = %{direction: :south, position: {x, y}}), do: %{robot | position: {x, y - 1}}
  defp advance(robot = %{direction: :east, position: {x, y}}), do: %{robot | position: {x + 1, y}}
  defp advance(robot = %{direction: :west, position: {x, y}}), do: %{robot | position: {x - 1, y}}
end

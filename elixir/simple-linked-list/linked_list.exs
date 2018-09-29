defmodule LinkedList do
  import Kernel, except: [length: 1]
  alias LinkedList

  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: {elem, list}

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list), do: length(list, 0)
  defp length({}, acc), do: acc
  defp length({_, t}, acc), do: length(t, acc + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list), do: length(list) == 0

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({h, _}), do: {:ok, h}
  def peek(_), do: {:error, :empty_list}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({_, t}), do: {:ok, t}
  def tail(_), do: {:error, :empty_list}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({h, t}), do: {:ok, h, t}
  def pop(_), do: {:error, :empty_list}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list), do: from_list(list, new())
  defp from_list([], acc), do: acc
  defp from_list([h | t], acc), do: push(from_list(t, acc), h)

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    case pop(list) do
      {:ok, h, t} -> [h | to_list(t)]
      _ -> []
    end
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list), do: reverse(pop(list), new())
  defp reverse({:ok, h, t}, acc), do: reverse(pop(t), push(acc, h))
  defp reverse(_, acc), do: acc
end

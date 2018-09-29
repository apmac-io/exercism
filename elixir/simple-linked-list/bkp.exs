defmodule LinkedList do
  import Kernel, except: [length: 1]
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length({}) do
    0
  end

  def length({_, t}) do
    1 + length(t)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    list == {}
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({h, _}) do
    {:ok, h}
  end

  def peek(_) do
    {:error, :empty_list}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({_, t}) do
    {:ok, t}
  end

  def tail(_) do
    {:error, :empty_list}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({h, t}) do
    {:ok, h, t}
  end

  def pop(_) do
    {:error, :empty_list}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    from_list(list, LinkedList.new())
  end

  defp from_list([], acc) do
    acc
  end

  defp from_list([h | t], acc) do
    LinkedList.push(from_list(t, acc), h)
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    case LinkedList.pop(list) do
      {:ok, h, t} -> [h | to_list(t)]
      _ -> []
    end
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    reverse(LinkedList.pop(list), LinkedList.new())
  end

  defp reverse({:ok, h, t}, acc) do
    reverse(LinkedList.pop(t), LinkedList.push(acc, h))
  end

  defp reverse(_, acc) do
    acc
  end
end

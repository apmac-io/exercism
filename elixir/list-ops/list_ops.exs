defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  defp count([], acc), do: acc
  defp count([_head | tail], acc), do: count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])
  defp map([], _f, acc), do: reverse(acc)
  defp map([head | tail], f, acc), do: map(tail, f, [f.(head) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([], _f, acc), do: reverse(acc)
  defp filter([head | tail], f, acc), do: filter(tail, f, (f.(head) && [head | acc]) || acc)

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b)
  defp do_append([], acc), do: acc
  defp do_append([head | tail], acc), do: do_append(tail, [head | acc])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat(ll, [])
  defp concat([], acc), do: reverse(acc)
  defp concat([[] | list], acc), do: concat(list, acc)
  defp concat([[head | tail] | list], acc), do: concat([head, tail | list], acc)
  defp concat([head | tail], acc), do: concat(tail, [head | acc])
end

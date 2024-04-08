ExUnit.start()

defmodule ConcatenacaoExclusiva do

  defp list_in_common([], _list_2, acc_list), do: acc_list

  defp list_in_common([head | tail], list_2, acc_list) do
    cond do
      compare(head, list_2) ->
        list_in_common(tail, list_2, [head | acc_list])
      :true ->
        list_in_common(tail, list_2, acc_list)
    end
  end

  defp compare(_num, []), do: false

  defp compare(num, [head | tail]) do
    cond do
      head == num ->
        true
      :true ->
        compare(num, tail)
    end
  end

  defp join(list_1, list_2, list_common) do
    new_list_1 = list_1 -- list_common
    new_list_2 = list_2 -- list_common
    new_list_1 ++ new_list_2
  end

 @spec run(list(any), list(any)) :: list(any)
  def run(lista1, lista2) do
    join(lista1, lista2, list_in_common(lista1, lista2, []))
  end

end

defmodule ConcatenacaoExclusivaTest do
  use ExUnit.Case, async: true

  test "concatena listas excluindo elementos repetidos" do
    assert ConcatenacaoExclusiva.run([1, 2, 3], [3, 4, 5]) == [1, 2, 4, 5]
  end

  test "concatena uma lista vazia com uma lista não vazia" do
    assert ConcatenacaoExclusiva.run([], [1, 2, 3]) == [1, 2, 3]
  end
end

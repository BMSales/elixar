defmodule Subgroup do
  
  def subgroup_make(groupie, tail) do
    subgrouper(groupie, tail, [])
  end

  defp subgrouper(_groupie, [], acc), do: acc

  defp subgrouper(groupie, [head | tail], acc) do
    subgrouper(groupie, tail, [groupie ++ [head] | acc])
  end

  defp make_groupie(pivot, tail, acc) do
    cond do
      Kernel.length(tail) > 1 ->
        [tail_head | tail_tail] = tail
        groupie = [pivot, tail_head]
        make_groupie(pivot, tail_tail, acc ++ subgroup_make(groupie, tail_tail))
      :true ->
        acc
    end
  end

  def run(list) do
    [pivot | tail] = list
    make_groupie(pivot, tail, [])
  end
end

Subgroup.run([1, 2, 3, 4, 5, 6, 7]) |> IO.inspect()

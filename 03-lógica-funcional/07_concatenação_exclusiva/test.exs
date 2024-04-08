defmodule CompList do

  def run(list_1, list_2) do
    repetitions(list_1, list_2, [])
  end
  
  defp repetitions([], _list_2, acc_list), do: acc_list

  defp repetitions([head | tail], list_2, acc_list) do
    cond do
      compare(head, list_2) ->
        repetitions(tail, list_2, [head | acc_list])
      :true ->
        repetitions(tail, list_2, acc_list)
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

end

CompList.run([1, 2, 3, 4], [1, 7, 8, 2])|> IO.inspect()

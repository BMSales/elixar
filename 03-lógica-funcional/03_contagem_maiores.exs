ExUnit.start()

defmodule ContagemMaioresQue do
  @doc """
  Conta quantos elementos em uma lista são maiores que um dado número N, utilizando recursão.

  ## Dicas
  - Considere o caso base onde a lista é vazia.

  ## Exemplos

      iex> ContagemMaioresQue.run([1, 2, 3, 4, 5], 3)
      2

      iex> ContagemMaioresQue.run([1, 2, 3], 5)
      0
  """
  @spec run(list(integer), integer) :: integer
  def run(nums, n) do
    larger(nums, n, 0)
  end

  defp larger([], _n, acc), do: acc

  defp larger([head | tail], n, acc) do 
    cond do
      head > n ->
        larger(tail, n, acc + 1) 
      :true ->
        larger(tail, n, acc)
    end
  end
end

defmodule ContagemMaioresQueTest do
  use ExUnit.Case, async: true

  test "conta elementos maiores que N" do
    assert ContagemMaioresQue.run([1, 2, 3, 4, 5], 3) == 2
  end

  test "retorna 0 se nenhum elemento for maior que N" do
    assert ContagemMaioresQue.run([1, 2, 3], 5) == 0
  end
end

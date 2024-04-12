ExUnit.start()

defmodule VerificacaoParenteses do
  @spec run(String.t()) :: boolean
  def run(s) do
    list = String.to_charlist(s)
    parantheses(list, 0)
  end

  defp parantheses([], counter) do
    cond do
      counter == 0 ->
        true
      :true ->
        false
    end
  end

  defp parantheses([head | tail], counter) do
    in_counter = cond do
      head == 40 ->
        counter + 1
      head == 41 ->
        counter - 1
      :true ->
        counter
    end

    cond do 
      in_counter < 0 ->
        false
      :true ->
        parantheses(tail, in_counter)
    end
  end
end

defmodule VerificacaoParentesesTest do
  use ExUnit.Case, async: true

  test "deve retornar true para uma string vazia" do
    assert VerificacaoParenteses.run("") == true
  end

  test "deve retornar true para strings com parênteses corretamente balanceados" do
    assert VerificacaoParenteses.run("()") == true
    assert VerificacaoParenteses.run("((()))") == true
  end

  test "deve retornar false para strings com parênteses não balanceados" do
    assert VerificacaoParenteses.run(")(") == false
    assert VerificacaoParenteses.run("((())") == false
  end
end

ExUnit.start()

defmodule InversaoString do
  @doc """
  Inverte uma string fornecida utilizando recursão.

  ## Dicas
  - Lembre-se de que uma string pode ser tratada como uma lista de caracteres.
  - Considere o caso base onde a string é vazia.

  ## Exemplos

      iex> InversaoString.run("elixir")
      "rixile"

      iex> InversaoString.run("")
      ""
  """
  @spec run(String.t()) :: String.t()
  def run(s) do
    list = String.to_charlist(s)
    invert(list, []) |> List.to_string()
  end

  defp invert([], inv_list), do: inv_list

  defp invert([head | tail], inv_list) do
    invert(tail, [head | inv_list])
  end

end

defmodule InversaoStringTest do
  use ExUnit.Case, async: true

  test "inverte uma string não vazia" do
    assert InversaoString.run("elixir") == "rixile"
  end

  test "retorna uma string vazia quando a entrada também for uma string vazia" do
    assert InversaoString.run("") == ""
  end
end

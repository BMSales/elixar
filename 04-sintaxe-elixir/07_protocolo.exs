ExUnit.start()

defmodule MinhaStruct do
  defstruct [:name]
end

defmodule ImplementacaoProtocolo do
  @doc """
  Implementa um protocolo para formatar structs diferentes.

  ## Dicas
  - Defina um protocolo `Formatar` com uma função `formatar/1`.
  - Implemente o protocolo para duas structs diferentes, retornando uma string formatada.

  ## Exemplos

      iex> ImplementacaoProtocolo.formatar(%MinhaStruct{name: "Elixir"})
      "MinhaStruct formatada: Elixir"
  """
  @spec formatar(map) :: String.t()
  def formatar(struct) do
    formatada = String.to_charlist(" formatada: ")
    name = String.to_charlist(struct.name)
    module_name = struct.__struct__ |> inspect |> String.to_charlist()

    module_name ++ formatada ++ name |> to_string
  end
end

defmodule ImplementacaoProtocoloTest do
  use ExUnit.Case, async: true

  test "formata corretamente as structs" do
    assert ImplementacaoProtocolo.formatar(%MinhaStruct{name: "Elixir"}) ==
             "MinhaStruct formatada: Elixir"
  end
end

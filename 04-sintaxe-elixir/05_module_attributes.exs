ExUnit.start()

defmodule UsoModuleAttributes do
  @param "42"
  @doc """
  Demonstra o uso de module attributes como constantes.

  ## Dicas
  - Defina um ou mais module attributes para serem usados como constantes dentro do módulo.

  ## Exemplos

      iex> UsoModuleAttributes.run()
      "O valor da constante é: 42"
  """
  @spec run() :: String.t()
  def run() do
    string = "O valor da constante é: "
    list_1 = String.to_charlist(string)
    list_2 = String.to_charlist(@param)
    list_final = list_1 ++ list_2
    List.to_string(list_final)
  end
end

defmodule UsoModuleAttributesTest do
  use ExUnit.Case, async: true

  test "retorna a string com o valor da constante" do
    assert UsoModuleAttributes.run() == "O valor da constante é: 42"
  end
end

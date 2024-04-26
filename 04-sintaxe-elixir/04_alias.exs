ExUnit.start()

defmodule Test do

  def printer(element) do
    IO.puts(element)
  end

end

defmodule UsoAlias do

  alias Test, as: Print
  
  @spec run() :: atom
  def run() do
    element = "yeah"
    Print.printer(element)
    :ok
  end

end

defmodule UsoAliasTest do
  use ExUnit.Case, async: true

  test "demonstra o uso de alias" do
    assert UsoAlias.run() == :ok
  end
end

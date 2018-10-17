defmodule AlphaVantageTest do
  use ExUnit.Case
  doctest AlphaVantage

  test "greets the world" do
    assert AlphaVantage.hello() == :world
  end
end

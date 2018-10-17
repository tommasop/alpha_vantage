defmodule Av.Stock do
  def daily(symbol) do
    {:ok, res} =
      [
        symbol: symbol,
        outputsize: "full"
      ]
      |> Keyword.merge(Av.Params.essential_data("TIME_SERIES_DAILY_ADJUSTED"))
      |> Av.Client.stock_request()

    res
  end

  def monthly(symbol) do
    {:ok, res} =
      [
        symbol: symbol
      ]
      |> Keyword.merge(Av.Params.essential_data("TIME_SERIES_MONTHLY_ADJUSTED"))
      |> Av.Client.stock_request()

    res
  end
end

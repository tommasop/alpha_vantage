defmodule Av.Indicator do
  def ema(symbol, interval, time_period, series_type) do
    {:ok, res} =
      [
        symbol: symbol,
        interval: interval,
        time_period: time_period,
        series_type: series_type
      ]
      |> Keyword.merge(Av.Params.essential_data("EMA"))
      |> Av.Client.indicator_request()

    res
  end

  def obv(symbol, interval, time_period, series_type) do
    {:ok, res} =
      [
        symbol: symbol,
        interval: interval,
        time_period: time_period,
        series_type: series_type
      ]
      |> Keyword.merge(Av.Params.essential_data("OBV"))
      |> Av.Client.indicator_request()

    res
  end
end

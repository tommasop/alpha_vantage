defmodule Av.Params do
  def stock_params do
    essential_params() ++ [:symbol, :datatype, :outputsize]
  end

  def indicator_params do
    stock_params() ++ [:interval, :time_period, :series_type]
  end

  def essential_data(function) do
    [apikey: Application.get_env(:av, :av_api_key), function: function]
  end

  defp essential_params do
    [:apikey, :function]
  end
end

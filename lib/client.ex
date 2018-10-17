defmodule Av.Client do
  @moduledoc """
  [Alpha Vantage](https://www.alphavantage.co/) API Client in Elixir.
  """

  @base_url "https://www.alphavantage.co/query"

  def stock_request(params) do
    filtered_params = Keyword.take(params, Av.Params.stock_params())
    do_request(filtered_params)
  end

  def indicator_request(params) do
    filtered_params = Keyword.take(params, Av.Params.indicator_params())
    do_request(filtered_params)
  end

  defp do_request(params) do
    url = @base_url <> "/?" <> URI.encode_query(params)

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Poison.decode(body) do
          {:ok, decoded} -> {:ok, decoded}
          {:error, error} -> {:error, error}
        end

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, status_code}

      {:error, error} ->
        {:error, error}
    end
  end
end

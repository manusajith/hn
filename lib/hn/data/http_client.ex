defmodule HN.Data.HttpClient do
  @moduledoc """
  HTTP client wrapper build on top of Finch.
  """
  require Logger

  @doc """
  Make a get request to the given url, and return a json response.
  """
  @spec get(binary | URI.t()) :: any
  def get(url) do
    :get
    |> Finch.build(url)
    |> Finch.request(HN.Finch)
    |> parse_response()
  end

  defp parse_response(response) do
    case response do
      {:ok, %Finch.Response{body: body}} -> Jason.decode!(body, keys: :atoms)
      {:error, error} -> Logger.error(error)
    end
  end
end

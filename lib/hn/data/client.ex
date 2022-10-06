defmodule HN.Data.Client do
  @moduledoc """
  Client wrapper for fetching data from HN API.
  """

  @base_url "https://hacker-news.firebaseio.com/v0/"

  alias HN.Data.HttpClient

  require Logger

  @doc """
  Fetch top stories from HN API and save it to ETS Table.
  """
  @spec fetch_top_stories() :: :ok
  def fetch_top_stories() do
    top_story_ids = fetch_top_story_ids()

    Enum.map(top_story_ids, fn id ->
      id |> fetch_story
    end)
  end

  defp fetch_top_story_ids() do
    url = @base_url <> "/topstories.json"
    HttpClient.get(url)
  end

  defp fetch_story(id) do
    url = @base_url <> "/item/#{id}.json"
    story = HttpClient.get(url)
    Logger.debug(story)
  end
end

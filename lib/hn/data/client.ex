defmodule HN.Data.Client do
  @moduledoc """
  Client wrapper for fetching data from HN API.
  """

  @base_url "https://hacker-news.firebaseio.com/v0/"

  alias HN.Data.HttpClient
  alias HN.Storage.Story

  @doc """
  Fetch top stories from HN API and save it to ETS Table.
  """
  @spec fetch_top_stories() :: :ok
  def fetch_top_stories() do
    top_story_ids = fetch_top_story_ids()

    stream =
      Task.async_stream(
        top_story_ids,
        fn id ->
          id |> fetch_story |> save_story
        end,
        ordered: false,
        max_concurrency: 100,
        timeout: 30_000
      )

    Stream.run(stream)
  end

  defp fetch_top_story_ids() do
    url = @base_url <> "/topstories.json"
    HttpClient.get(url)
  end

  defp fetch_story(id) do
    url = @base_url <> "/item/#{id}.json"
    HttpClient.get(url)
  end

  defp save_story(story) do
    story = struct(%Story{}, story)
    :ets.insert(:stories, {story.id, story})
  end
end

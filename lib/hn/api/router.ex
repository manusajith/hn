defmodule HN.API.Router do
  use Plug.Router
  plug(:match)
  plug(:dispatch)

  alias HN.Storage.Repo

  get "/" do
    send_resp(conn, 200, "HN API")
  end

  get "/stories/:id" do
    ["stories", story_id] = conn.path_info

    case Repo.get(:stories, String.to_integer(story_id)) do
      nil -> send_resp(conn, 404, "404")
      story -> send_resp(conn, 200, Jason.encode!(story))
    end
  end

  get "/stories" do
    {stories, _continuation} =
      case conn.query_string do
        "" ->
          fetch_stories("")

        query ->
          "page=" <> page = query
          page = String.to_integer(page)
          fetch_stories(page)
      end

    send_resp(conn, 200, Jason.encode!(stories))
  end

  match _ do
    send_resp(conn, 404, "404")
  end

  defp fetch_stories(page) when page == "" do
    Repo.list(:stories, 10)
  end

  defp fetch_stories(page) when page == 1 do
    Repo.list(:stories, 10)
  end

  defp fetch_stories(page) when page > 1 do
    {_stories, cont} = Repo.list(:stories, 10)
    fetch_stories(page - 1, cont)
  end

  defp fetch_stories(page, cont) when page == 0 do
    Repo.list(cont)
  end

  defp fetch_stories(page, cont) when page > 0 do
    {_stories, cont} = Repo.list(cont)
    fetch_stories(page - 1, cont)
  end
end

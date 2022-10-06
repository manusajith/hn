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
    {stories, _cont} = Repo.list(:stories, 10)
    send_resp(conn, 200, Jason.encode!(stories))
  end
end

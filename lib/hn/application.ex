defmodule HN.Application do
  @moduledoc false

  use Application

  @impl true
  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    initialise_storage()

    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: HN.API.Router,
        options: [dispatch: dispatch(), port: port()]
      ),
      {Finch, name: HN.Finch}
    ]

    opts = [strategy: :one_for_one, name: HN.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp initialise_storage do
    :ets.new(:stories, [:named_table, :public])
  end

  defp dispatch do
    [
      {:_,
       [
         {:_, Plug.Cowboy.Handler, {HN.API.Router, []}}
       ]}
    ]
  end

  defp port do
    String.to_integer(System.get_env("PORT") || "4000")
  end
end

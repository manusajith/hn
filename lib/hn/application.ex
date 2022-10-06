defmodule HN.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: HN.Finch}
    ]

    opts = [strategy: :one_for_one, name: HN.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

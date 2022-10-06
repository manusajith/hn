defmodule HN.Application do
  @moduledoc false

  use Application

  @impl true
  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    initialise_storage()

    children = [
      {Finch, name: HN.Finch}
    ]

    opts = [strategy: :one_for_one, name: HN.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp initialise_storage do
    :ets.new(:stories, [:named_table, :public])
  end
end

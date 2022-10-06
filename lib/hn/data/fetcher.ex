defmodule HN.Data.Fetcher do
  @moduledoc """
  Worker for fetching new top stories from HN API.
  """
  use GenServer

  alias HN.Api.Websocket
  alias HN.Data.Client
  alias HN.Storage.Repo

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  @spec init(any) :: {:ok, any, {:continue, :fetch_initial_data}}
  def init(state) do
    {:ok, state, {:continue, :fetch_initial_data}}
  end

  @impl true
  @spec handle_continue(:fetch_initial_data, any) :: {:noreply, any}
  def handle_continue(:fetch_initial_data, state) do
    refresh(state)
    schedule_refresh()
    {:noreply, state}
  end

  @impl true
  def handle_info(:refresh, state) do
    refresh(state)
    schedule_refresh()

    {:noreply, state}
  end

  defp schedule_refresh do
    Process.send_after(self(), :refresh, refresh_interval())
  end

  defp refresh(_state) do
    Client.fetch_top_stories()
    notify()
  end

  defp refresh_interval do
    String.to_integer(System.get_env("REFRESH_INTERVAL", "300000"))
  end

  defp notify do
    {stories, _continuation} = Repo.list(:stories, 50)
    Websocket.send_broadcast(stories)
  end
end

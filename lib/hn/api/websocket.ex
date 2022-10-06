defmodule HN.Api.Websocket do
  @behaviour :cowboy_websocket

  @impl true
  def init(request, _state) do
    state = %{path: request.path}
    {:cowboy_websocket, request, state}
  end

  @impl true
  def websocket_init(state) do
    Registry.HN
    |> Registry.register(state.path, {})

    {:ok, state}
  end

  @impl true
  def websocket_info(info, state) do
    {:reply, {:text, info}, state}
  end

  @impl true
  def websocket_handle({:text, _message}, state) do
    {:reply, {:text, "Pong!"}, state}
  end
end

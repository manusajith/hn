defmodule HN.Storage.Repo do
  @moduledoc """
  Module providing access to ETS tables.
  """

  @doc """
  Return an item in ETS by its id.
  """
  @spec get(atom | :ets.tid(), any) :: any
  def get(table, id) do
    case :ets.lookup(table, id) do
      [{_id, record}] -> record
      [] -> nil
    end
  end

  @doc """
  Returns n number of items from the ETS table.
  """
  def list(continuation) do
    :ets.select(continuation)
  end

  def list(table, limit) do
    :ets.select(table, [{{:"$1", :"$2"}, [], [:"$2"]}], limit)
  end
end

defmodule HN.Storage.Story do
  @moduledoc """
  Schema for stories.
  """

  @derive Jason.Encoder
  defstruct [:id, :title, :url, :text, :by]
end

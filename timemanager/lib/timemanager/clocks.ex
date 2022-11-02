defmodule Timemanager.Clocks do
  @moduledoc """
  The Clocks context.
  """

  import Ecto.Query, warn: false
  alias Timemanager.Repo

  alias Timemanager.Clocks.Clock

  def get_clock_by_user_id(user_id) do
    query = from c in Clock,
      where: c.user == ^user_id
    Repo.all(query)
  end

  def create_clock(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end
end

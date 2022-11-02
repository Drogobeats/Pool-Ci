defmodule Timemanager.Workingtimes do
  @moduledoc """
  The Workingtimes context.
  """

  import Ecto.Query, warn: false
  alias Timemanager.Repo

  alias Timemanager.Workingtimes.Workingtime

  def list_workingtimes do
    Repo.all(Workingtime)
  end

  def get_workingtime!(id), do: Repo.get!(Workingtime, id)

  def get_workingtimes_by_user_id_and_dates(start_date, end_date) do
    query = from wt in Workingtime,
      join: u in Timemanager.Accounts.User,
      on: u.id == wt.user,
      where: wt.start == ^start_date and wt.end == ^end_date
    Repo.all(query)
  end

  def get_workingtime_by_id_and_user_id(user_id, id) do
    query = from wt in Workingtime,
      where: wt.user == ^user_id and wt.id == ^id
    Repo.all(query)
  end

  def create_workingtime(attrs \\ %{}) do
    %Workingtime{}
    |> Workingtime.changeset(attrs)
    |> Repo.insert()
  end

  def update_workingtime(%Workingtime{} = workingtime, attrs) do
    workingtime
    |> Workingtime.changeset(attrs)
    |> Repo.update()
  end

  def delete_workingtime(%Workingtime{} = workingtime) do
    Repo.delete(workingtime)
  end

  def change_workingtime(%Workingtime{} = workingtime, attrs \\ %{}) do
    Workingtime.changeset(workingtime, attrs)
  end
end

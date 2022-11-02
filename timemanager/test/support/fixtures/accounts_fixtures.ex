defmodule Timemanager.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Timemanager.Accounts.create_user()

    user
  end
end

defmodule Timemanager.ClocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Clocks` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-24 10:09:00]
      })
      |> Timemanager.Clocks.create_clock()

    clock
  end
end

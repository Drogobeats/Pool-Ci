defmodule TimemanagerWeb.ClockController do
  use TimemanagerWeb, :controller

  alias Timemanager.Clocks
  alias Timemanager.Clocks.Clock

  action_fallback TimemanagerWeb.FallbackController

  def create_by_user_id(conn, %{"userID" => user_id, "clock" => clock_params}) do
    clock_params = Map.put(clock_params, "user", user_id)
    with {:ok, %Clock{} = clock} <- Clocks.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"userID" => user_id}) do
    clocks = Clocks.get_clock_by_user_id(user_id)
    render(conn, "index.json", clocks: clocks)
  end
end

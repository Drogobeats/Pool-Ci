defmodule TimemanagerWeb.Router do
  use TimemanagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TimemanagerWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

   scope "/api", TimemanagerWeb do
     pipe_through :api

     #Users routing
     resources "/users", UserController, except: [:new, :edit], param: "userID"

     #Clocks routing
     get "/clocks/:userID", ClockController, :show
     post "/clocks/:userID", ClockController, :create_by_user_id

     #Workingtimes routing
     resources "/workingtimes", WorkingtimeController, except: [:new, :edit, :create]
     post "/workingtimes/:userID", WorkingtimeController, :create
     get "/workingtimes/:userID/:id", WorkingtimeController, :get_working_time_by_id_and_user_id
    end
end

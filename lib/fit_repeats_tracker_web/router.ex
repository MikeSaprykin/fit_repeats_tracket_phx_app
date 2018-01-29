defmodule FitRepeatsTrackerWeb.Router do
  use FitRepeatsTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FitRepeatsTrackerWeb do
    pipe_through :api


    get "/users", UserController, :index
    post "/users", UserController, :create
    get "/users/:id", UserController, :show
  end
end

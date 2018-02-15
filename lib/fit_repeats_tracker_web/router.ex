defmodule FitRepeatsTrackerWeb.Router do
  use FitRepeatsTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Guardian.Plug.VerifyHeader, key: :authentication
    plug Guardian.Plug.EnsureAuthenticated, key: :authentication
  end

  scope "/api", FitRepeatsTrackerWeb do
    pipe_through :api

    resources "/users", UserController

    get "/bands", BandsController, :index
  end
end

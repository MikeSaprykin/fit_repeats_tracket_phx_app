defmodule FitRepeatsTrackerWeb.Router do
  use FitRepeatsTrackerWeb, :router

  pipeline :auth do
    plug FitRepeatsTracker.Accounts.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FitRepeatsTrackerWeb do
    pipe_through :api

    scope "/auth" do
      post "/login", AuthController, :login

      post "/register", AuthController, :register
    end

    scope "/users" do
      pipe_through [:auth, :ensure_auth]

      resources "/", UserController
    end

  end
end

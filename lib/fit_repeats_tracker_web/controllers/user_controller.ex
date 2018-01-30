defmodule FitRepeatsTrackerWeb.UserController do
  use FitRepeatsTrackerWeb, :controller

#  plug Guardian.Plug.Pipeline, module: FitRepeatsTrackerWeb.Guardian,
#                               error_handler: FitRepeatsTracker.Accounts.AuthErrorHandler
#  plug Guardian.Plug.VerifyHeader, key: :authentication
#  plug Guardian.Plug.EnsureAuthenticated, key: :authentication

  alias FitRepeatsTracker.Accounts
  alias FitRepeatsTracker.Accounts.User

  action_fallback FitRepeatsTrackerWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Accounts.create_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
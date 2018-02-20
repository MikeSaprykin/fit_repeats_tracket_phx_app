defmodule FitRepeatsTrackerWeb.AuthController do
  use FitRepeatsTrackerWeb, :controller

  alias FitRepeatsTracker.Accounts
  alias FitRepeatsTracker.Accounts.Guardian

  action_fallback FitRepeatsTrackerWeb.FallbackController

  def login(conn, %{"username" => username, "password" => password}) do
    Accounts.auth_user(username, password)
    |> login_reply(conn)
  end

  defp login_reply({:error, _error}, conn) do
    body = Poison.encode!(%{message: "Username or password is invalid"})
    conn
    |> send_resp(401, body)
  end

  defp login_reply({:ok, user}, conn, qwe) do
    {:ok, token, _claims} = Guardian.encode_and_sign(user)
    conn
    |> render("login.json", token: token)
  end

  def register(conn, params) do
    Accounts.create_user(params)
    |> register_reply(conn)
  end

  defp register_reply({:error, changeset}, conn) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(FitRepeatsTrackerWeb.ChangesetView, "error.json", changeset: changeset)
  end

  defp register_reply({:ok, _user}, conn) do
    conn
    |> send_resp(204, "")
  end

end

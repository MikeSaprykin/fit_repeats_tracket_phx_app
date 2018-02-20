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

  defp login_reply({:ok, user}, conn) do
    {:ok, token, _claims} = Guardian.encode_and_sign(user)
    conn
    |> render("login.json", token: token)
  end

end

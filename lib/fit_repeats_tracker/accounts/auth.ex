defmodule FitRepeatsTracker.Accounts.Auth do
  alias FitRepeatsTracker.Repo
  alias FitRepeatsTracker.Accounts.User

  def authenticate(%{"email" => email, "password" => password}) do
    with user <- Repo.get_by!(User, email: email) do
      case verify_password(password, user.password) do
        true ->
          {:ok, user}
        _ ->
          :error
      end
    end
  end

  defp verify_password(password, hash) do
    Comeonin.Bcrypt.checkpw(password, hash)
  end

end
defmodule FitRepeatsTracker.Accounts.Auth do
  alias FitRepeatsTracker.Repo
  alias FitRepeatsTracker.Accounts.User
  alias Comeonin.Bcrypt


  def authenticate_user(username, plain_text_password) do
    with user <- Repo.get_by!(User, username: username) do
      check_password(user, plain_text_password)
    end
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end

end

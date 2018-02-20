defmodule FitRepeatsTracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias FitRepeatsTracker.Accounts.User

  alias Comeonin.Bcrypt


  schema "users" do
    field :username, :string
    field :avatar_url, :string
    field :email, :string
    field :password, :string
    field :provider, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

#  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  
  defp put_pass_hash(changeset), do: changeset
  
end

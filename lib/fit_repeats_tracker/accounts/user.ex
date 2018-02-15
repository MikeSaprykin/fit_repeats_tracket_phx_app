defmodule FitRepeatsTracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias FitRepeatsTracker.Accounts.User


  schema "users" do
    field :username, :string
    field :avatar_url, :string
    field :email, :string
    field :password, :string
    field :provider, :string
    field :first_name, :string
    field :last_name, :string
    many_to_many :bands, FitRepeatsTracker.Bands.Band, join_through: "users_bands"
    has_many :created_bands, FitRepeatsTracker.Bands.Band

    timestamps()
  end

#  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end

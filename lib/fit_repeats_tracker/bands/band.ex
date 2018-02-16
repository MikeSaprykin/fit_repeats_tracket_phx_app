defmodule FitRepeatsTracker.Bands.Band do
  use Ecto.Schema
  import Ecto.Changeset
  alias FitRepeatsTracker.Bands.Band

  schema "bands" do
    field :title, :string
    field :avatar_url, :string
    belongs_to :user, FitRepeatsTracker.Accounts.User
    many_to_many :members, FitRepeatsTracker.Accounts.User, join_through: "users_bands"
    has_many :band_invitations, FitRepeatsTracker.Bands.Invitation

    timestamps()
  end

  def changeset(%Band{} = band, attrs) do
    band
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end


end

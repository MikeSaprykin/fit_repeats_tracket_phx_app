defmodule FitRepeatsTracker.Bands.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias FitRepeatsTracker.Bands.Invitation

  schema "band_invitations" do
    belongs_to :user, FitRepeatsTracker.Accounts.User
    belongs_to :band, FitRepeatsTracker.Bands.Band
  end

end

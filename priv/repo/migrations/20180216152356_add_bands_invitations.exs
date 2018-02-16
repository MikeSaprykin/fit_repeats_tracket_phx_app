defmodule FitRepeatsTracker.Repo.Migrations.AddBandsInvitations do
  use Ecto.Migration

  def change do
    create table(:band_invitations) do
      add :band_id, references(:bands)
      add :user_id, references(:users)
    end
  end
end

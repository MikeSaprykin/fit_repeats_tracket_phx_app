defmodule FitRepeatsTracker.Repo.Migrations.ChageBandsSchemaWithUserId do
  use Ecto.Migration

  def change do
    alter table(:bands) do
      add :user_id, references(:users)
      remove :creator_id
    end
  end
end

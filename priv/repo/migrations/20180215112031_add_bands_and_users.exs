defmodule FitRepeatsTracker.Repo.Migrations.AddBandsAndUsers do
  use Ecto.Migration

  def change do

    create table(:bands) do
      add :title, :string
      add :avatar_url, :string
      add :creator_id, references(:users)

      timestamps()
    end

    create table(:users_bands, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :band_id, references(:bands, on_delete: :delete_all)
    end
  end
end

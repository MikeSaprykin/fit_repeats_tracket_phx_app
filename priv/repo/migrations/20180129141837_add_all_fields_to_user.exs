defmodule FitRepeatsTracker.Repo.Migrations.AddAllFieldsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :avatar_url, :string
      add :email, :string
      add :password, :string
      add :provider, :string
      add :first_name, :string
      add :last_name, :string
    end

    create unique_index(:users, [:email])
  end
end

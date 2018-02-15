defmodule FitRepeatsTrackers.Bands do

  import Ecto.Query, warn: false

  alias FitRepeatsTracker.Repo
  alias FitRepeatsTracker.Bands.Band
  alias FitRepeatsTracker.Accounts.User

  def list_bands do
    Repo.all(Band)
  end

  def get_band!(id), do: Repo.get!(Band, id)

  def create_band(%{"band" => band, "id" => user_id}) do
    User
    |> Repo.get(user_id)
    |> Ecto.build_assoc(:created_bands)
    |> Band.changeset(band)
    |> Repo.insert
  end

  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  def add_band_member(%{"band_id" => band_id, "id" => id}) do
    band_changeset = Repo.get(Band, band_id)
                     |> Ecto.Changeset.change()
    user = Repo.get(User, id)
    band_with_user = Ecto.Changeset.put_assoc(band_changeset, :users, [user])
    Repo.update(band_with_user)
  end

end
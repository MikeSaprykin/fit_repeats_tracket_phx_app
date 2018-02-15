defmodule FitRepeatsTrackers.Bands do

  import Ecto.Query, warn: false

  alias FitRepeatsTracker.Repo
  alias FitRepeatsTracker.Bands.Band

  def list_bands do
    Repo.all(Band)
  end

  def get_band!(id), do: Repo.get!(Band, id)

  def create_band(%{"band" => band, "user" => user}) do
    user
    |> Repo.build_assoc(:bands)
    |> Band.changeset(band)
    |> Repo.insert()
  end

  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  def add_band_member(%{"band" => band, "user" => user}) do

  end

end
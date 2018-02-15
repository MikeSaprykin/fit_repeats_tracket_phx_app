defmodule FitRepeatsTrackerWeb.BandsController do
  use FitRepeatsTrackerWeb, :controller

  alias FitRepeatsTrackers.Bands
  alias FitRepeatsTracker.Bands.Band

  action_fallback FitRepeatsTrackerWeb.FallbackController

  def index(conn, _params) do
    bands = Bands.list_bands()
    render(conn, "index.json", bands: bands)
  end

  def show(conn, %{"id" => id}) do
    band = Bands.get_band!(id)
    render(conn, "show.json", band: band)
  end

  def create(conn, params) do
    with {:ok, %Band{} = band} <- Bands.create_band(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", bands_path(conn, :show, band))
      |> render("show.json", band: band)
    end
  end

end

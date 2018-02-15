defmodule FitRepeatsTrackerWeb.BandsController do
  use FitRepeatsTrackerWeb, :controller

  alias FitRepeatsTrackers.Bands
  alias FitRepeatsTrackers.Bands.Band

  action_fallback FitRepeatsTrackerWeb.FallbackController

  def index(conn, _params) do
    bands = Bands.list_bands()
    render(conn, "index.json", bands: bands)
  end

end

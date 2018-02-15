defmodule FitRepeatsTrackerWeb.BandsView do
  use FitRepeatsTrackerWeb, :view
  alias FitRepeatsTrackerWeb.BandsView

  def render("index.json", %{bands: bands}) do
    %{data: render_many(bands, BandsView, "bands.json")}
  end

  def render("show.json", %{band: band}) do
    %{data: render_one(band, BandsView, "bands.json")}
  end

  def render("bands.json", %{band: band}) do
    %{id: band.id,
      title: band.username}
  end
end

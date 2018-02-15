defmodule FitRepeatsTrackerWeb.BandsView do
  use FitRepeatsTrackerWeb, :view
  alias FitRepeatsTrackerWeb.BandsView

  def render("index.json", %{bands: bands}) do
    %{data: render_many(bands, BandsView, "band.json", as: :band)}
  end

  def render("show.json", %{band: band}) do
    %{data: render_one(band, BandsView, "band.json", as: :band)}
  end

  def render("band.json", %{band: band}) do
    %{id: band.id,
      title: band.title}
  end
end

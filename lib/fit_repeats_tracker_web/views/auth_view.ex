defmodule FitRepeatsTrackerWeb.AuthView do
  use FitRepeatsTrackerWeb, :view

  def render("login.json", %{token: token}) do
    %{token: token}
  end
end

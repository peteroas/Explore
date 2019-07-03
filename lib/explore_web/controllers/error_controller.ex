defmodule ExploreWeb.ErrorController do
  use ExploreWeb, :controller

  def index(conn, _params) do
    render(conn, "404_not_found.html")
  end
end
defmodule OpusWeb.PageController do
  use OpusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

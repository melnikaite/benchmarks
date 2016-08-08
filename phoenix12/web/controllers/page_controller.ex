defmodule Phoenix12.PageController do
  use Phoenix12.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

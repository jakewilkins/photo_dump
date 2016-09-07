defmodule PhotoDump.PageController do
  use PhotoDump.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

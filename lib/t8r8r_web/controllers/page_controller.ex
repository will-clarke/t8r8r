defmodule T8r8rWeb.PageController do
  use T8r8rWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

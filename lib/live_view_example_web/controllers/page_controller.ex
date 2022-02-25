defmodule LiveViewExampleWeb.PageController do
  use LiveViewExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

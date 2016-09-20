defmodule Roles.PageController do
  use Roles.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule Roles.Observer.DashboardController do
	use Roles.Web, :controller

	def index(conn, _params) do
		conn = put_flash(conn, :info, "Observer")
		%{params: %{conn: conn, template: "observer_index.html", messenger: "Observer"}}
	end

end


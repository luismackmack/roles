defmodule Roles.Manager.DashboardController do
	use Roles.Web, :controller

	def index(conn, _params) do
		conn = put_flash(conn, :info, "Manager")
		%{params: %{conn: conn, template: "manager_index.html", messenger: "Manager"}}
	end
end
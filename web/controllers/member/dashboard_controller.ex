defmodule Roles.Member.DashboardController do
 	use Roles.Web, :controller

	def index(conn, _params) do
	 	conn = put_flash(conn, :info, "Member")
	 	%{params: %{conn: conn, template: "member_index.html", messenger: "Member"}}
	end
end
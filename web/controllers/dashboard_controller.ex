defmodule Roles.DashboardController do
	use Roles.Web, :controller

	def index(conn, _params) do
		controller = Roles.MatchRole.match_role(conn)
		case controller do
			nil ->
				conn
				|> put_flash(:error, "You must be logged in to access that page")
				|> redirect(to: session_path(conn, :new))
			_ ->
				return = apply(controller.module, controller.action, [conn, :empty])
				render return.params.conn, return.params.template,  params: return.params
		end
	end
end
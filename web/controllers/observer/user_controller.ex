defmodule Roles.Observer.UserController do
	use Roles.Web, :controller

	alias Roles.Repo
	alias Roles.Rol
	alias Roles.User

	def index(conn, _params) do
		user = Repo.one(from u in User, preload: [:rol], where: u.id == ^conn.assigns.current_user.id)
		%{params: %{conn: conn, template: "observer_index.html", user: user}}
	end
end
defmodule Roles.Member.UserController do
	use Roles.Web, :controller

	alias Roles.Repo
	alias Roles.Rol
	alias Roles.User

	def index(conn, _params) do
		user = Repo.one(from u in User, preload: [:rol], where: u.id == ^conn.assigns.current_user.id)
		roles = Repo.all(Rol)
		%{params: %{conn: conn, template: "member_index.html", user: user, roles: roles}}
	end
end
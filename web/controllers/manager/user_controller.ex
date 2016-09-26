defmodule Roles.Manager.UserController do
	use Roles.Web, :controller

	alias Roles.Repo
	alias Roles.Rol
	alias Roles.User

	def index(conn, _params) do
		users = Repo.all(from u in User, preload: [:rol])
		%{params: %{conn: conn, template: "manager_index.html", users: users}}
	end
end
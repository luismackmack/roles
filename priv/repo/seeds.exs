# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Roles.Repo.insert!(%Roles.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Roles.Repo
alias Roles.Rol
alias Roles.User
alias Comeonin.Bcrypt
import Ecto.Query


params = %{rolname: "manager"}
changeset = Rol.changeset(%Rol{}, params)
Repo.insert(changeset)

params = %{rolname: "member"}
changeset = Rol.changeset(%Rol{}, params)
Repo.insert(changeset)

params = %{rolname: "observer"}
changeset = Rol.changeset(%Rol{}, params)
Repo.insert(changeset)



user_params = %{username: "usuariomanager", password: "usuariomanager", rol_id: 1} 
changeset = User.registration_changeset(%User{}, user_params)     
Repo.insert(changeset)

user_params = %{username: "usuariomember", password: "usuariomember", rol_id: 2}
changeset = User.registration_changeset(%User{}, user_params)
Repo.insert(changeset)

user_params = %{username: "usuarioobserver", password: "usuarioobserver", rol_id: 3}
changeset = User.registration_changeset(%User{}, user_params)
Repo.insert(changeset)

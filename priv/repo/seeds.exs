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



params = %{username: "usuariomanager", password: Bcrypt.hashpwsalt("usuariomanager"), rol_id: 1}      
changeset = User.changeset(%User{}, params)
Repo.insert(changeset)

params = %{username: "usuariomember", password: Bcrypt.hashpwsalt("usuariomember"), rol_id: 2}  
changeset = User.changeset(%User{}, params)
Repo.insert(changeset)

params = %{username: "usuarioobserver", password: Bcrypt.hashpwsalt("usuarioobserver"), rol_id: 3}
changeset = User.changeset(%User{}, params)
Repo.insert(changeset)